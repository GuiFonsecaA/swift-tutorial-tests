//
//  LeilaoTests.swift
//  LeilaoTests
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
 
    }
    
    func testDeveReberUmLance() {
        let leilao = Leilao(descricao: "iPhone 15")
        XCTAssertEqual(0, leilao.lances?.count)
        
        let guilherme = Usuario(nome: "Guilherme")
        leilao.propoe(lance: Lance(guilherme, 1000.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(1000.0, leilao.lances?.first?.valor)
    }
    
    func testDeveReceberVariosLances() {
        let leilao = Leilao(descricao: "air Pods")
        
        let leticia = Usuario(nome: "Leticia")
        leilao.propoe(lance: Lance(leticia, 2000))
        
        let ronaldo = Usuario(nome: "Ronaldo")
        leilao.propoe(lance: Lance(ronaldo, 1500))
        
        XCTAssertEqual(2, leilao.lances?.count)
        XCTAssertEqual(2000, leilao.lances?.first?.valor)
        XCTAssertEqual(1500, leilao.lances?[1].valor)
    }
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario() {
        let leilao = Leilao(descricao: "iPad")
        let maria = Usuario(nome: "Maria")
        
        leilao.propoe(lance: Lance(maria, 2000))
        leilao.propoe(lance: Lance(maria, 3000))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000, leilao.lances?.first?.valor)
    }
}
