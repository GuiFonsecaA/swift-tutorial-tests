//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Guilherme Fonseca on 31/07/23.
//  Copyright © 2023 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

final class AvaliadorTests: XCTestCase {
    
    var leiloeiro: Avaliador!
    private var joao: Usuario!
    private var jose: Usuario!
    private var maria: Usuario!

    override func setUpWithError() throws {
        leiloeiro = Avaliador()
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
    }

    override func tearDownWithError() throws {
        
    }

    func testDeveEntenderLancesEmOrdemCrescente() {
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        try? leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLeilaoComLanceUnico() {
        let leilao = Leilao(descricao: "Playstation 5")
        leilao.propoe(lance: Lance(joao, 250.0))
        
        try? leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(250.0, leiloeiro.maiorLance())
    }
    
    func testDeveEncontrarOsTresMaioresLances() {
        
        let leilao = CriadorDeLeilao().para(descricao: "iPhone 15")
            .lance(joao, 300.0)
            .lance(maria, 200.0)
            .lance(joao, 700.0)
            .lance(maria, 400.0)
            .constroi()
        
        try? leiloeiro.avalia(leilao: leilao)
        
        let listaDeLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaDeLances.count)
        XCTAssertEqual(700.0, listaDeLances[0].valor)
        XCTAssertEqual(400.0, listaDeLances[1].valor)
        XCTAssertEqual(300.0, listaDeLances[2].valor)
    }
    
    func testDeveIgnorarLeilaoSemNenhumLance() {
        let leilao = CriadorDeLeilao().para(descricao: "PlayStation 5").constroi()
        
        XCTAssertThrowsError(try leiloeiro.avalia(leilao: leilao), "Não é possivel avaliar um leilão sem lances") { error in
            print(error.localizedDescription)
        }
    }
}
