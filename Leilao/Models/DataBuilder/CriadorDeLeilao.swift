//
//  CriadorDeLeilao.swift
//  Leilao
//
//  Created by Guilherme Fonseca on 03/08/23.
//  Copyright © 2023 Alura. All rights reserved.
//

import UIKit

class CriadorDeLeilao: NSObject {
    private var leilao: Leilao!
    func para(descricao: String) -> Self {
        leilao = Leilao(descricao: descricao)
        
        return self
    }

    func lance(_ usuario: Usuario, _ valor: Double) -> Self {
        leilao.propoe(lance: Lance(usuario, valor))
        return self
    }
    
    func constroi() -> Leilao{
        return leilao
    }
}
