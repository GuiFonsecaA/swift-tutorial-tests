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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDeveEntenderLancesEmOrdemCrescente() {
        // Cenario
        
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLeilaoComLanceUnico() {
        let joao = Usuario(nome: "Joao")
        
        let leilao = Leilao(descricao: "Playstation 5")
        leilao.propoe(lance: Lance(joao, 250.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(250.0, leiloeiro.maiorLance())
    }
    
    func testDeveEncontrarOsTresMaioresLances() {
        let joao = Usuario(nome: "João")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Iphone 15")
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(maria, 200.0))
        leilao.propoe(lance: Lance(joao, 700.0))
        leilao.propoe(lance: Lance(maria, 400.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        let listaDeLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaDeLances.count)
        XCTAssertEqual(700.0, listaDeLances[0].valor)
        XCTAssertEqual(400.0, listaDeLances[1].valor)
        XCTAssertEqual(300.0, listaDeLances[2].valor)
        
    }

}
