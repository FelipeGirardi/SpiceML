//
//  SpicesModel.swift
//  SpiceML
//
//  Created by Felipe Girardi on 29/04/20.
//  Copyright © 2020 Felipe Girardi. All rights reserved.
//

import Foundation
import UIKit

struct Spice {
    let name: String
    let description: String
    let usage: String
    let cultivation: String
    let image: UIImage
}

let manjericao = Spice(name: "Manjericão",
                       description: "O manjericão é uma planta medicinal e aromática também conhecida como Alfavaca, Basilicão, Anfádega e Erva-rea, muito utilizada para fazer remédios caseiros para aftas, tosse e dor de garganta." ,
                       usage: "Pode ser utilizado seco, pois é rico em óleos essenciais. Mas o consumo se dá melhor quando fresco. Deve-se acrescenta-lo ao final da preparação da receita, pois este é sensivel ao calor.",
                       cultivation: "Não possui muita necessidade de água, mas é importante regá-lo constantemente. Manter em lugar quente e luminoso. Para que esta continue crescendo, ao colher retire apenas a folha — assim, outra crescerá no lugar", image: UIImage(named: "manjericao")!)

let alecrim = Spice(name: "Alecrim",
                    description: "O alecrim é uma erva aromática comum na região do Mediterrâneo, conhecida pelo seu aroma forte e agradável. É utilizada com fins culinários, medicinais e religiosos, seu óleo essencial também é utilizado em perfumaria.", usage: "Pode ser utilizado fresco ou seco, na preparação de aves, carne de porco, linguiças e batatas ou ate em churrascos(espalhando sobre as brasas do carvão aceso). Já o seu já, traz como benefícios, auxílio na digestão e alivio da dor de cabeça",
                    cultivation: "Tolera climas mais secos, podendo passar até três dias sem ser regado. Pode ser plantado em pequenos espaços, como jardineiras ou vasos de tamanho médio e grande, podendo ser cultivado dentro de casa e deixando-o à mão para acrescentá-lo no preparo de uma refeição ou de um chá.",
                    image: UIImage(named: "alecrim")!)

let salsa = Spice(name: "Salsa",
                  description: "Também conhecida como 'Tempero ou Cheiro Verde', é um dos temperos mais comuns da culinária brasileira, pois é uma das ervas mais versáteis. Seu sabor é delicado, possuindo toques sutis de anis e combina com quase tudo: quiches, ensopados, tortas salgadas e sopas.",
                  usage: "Seu sabor é mais acentuado quando fresca e/ou recém-colhida, pois quando seca, ela perde parte do aroma. é recomendando adicionar apenas no fim do cozimento. Pode ser utilizada em saladas, molhos para todos os tipos de carnes, massas, sopas, peixes e legumes.",
                  cultivation: "Pode ser cultivada em jardins e vasos com terra fresca e adubada. Colher as folhas com frequência ajuda a manter a planta viva.",
                  image: UIImage(named: "salsa")!)

// Mudar imagem
let funcho = Spice(name: "Funcho",
                   description: "É comum em pequenas quantidades na cozinha mediterrânica cpor conta do seu aroma, pode ser consumidos fresco como parte de saladas. Seus talos e folhas são consumidos crus ou cozidos como ingredientes de diferentes pratos. Diferente da erva-doce (planta muito similar ao funcho), possui flores amarelas e folhas rendadas.",
                   usage: "Apesar de não ser muito tradiconal na culinária brasileira, além dos chás, o funcho pode ser consumido cru ou cozido, servindo como tempero para carne ou peixe ou saladas. Suas semestes também comumente  utilizadas para agregar sabor em bolos e pães",
                   cultivation: "Pode ser plantada em pequenos espaços ou em hortas, em qualquer região de norte a sul do país, pois se adapta aos diferentes climas do Brasil. Somente na primeira vez é preciso comprar as sementes, que, abundantes, não faltam para os cultivos subsequentes.",
                   image: UIImage(named: "curry")!)

let louro = Spice(name: "Louro",
                  description: "O loureiro é uma árvore, geralmente conhecido pela sua folha de odor específico e que é utilizado na culinária como tempero e em chás.",
                  usage: "É uma especiaria usada em uma grande variedade de receitas, particularmente entre as cozinhas mediterrâneas. Aqui no Brasil, o tempero é utilizado no preparo do feijão. Mas também pode ser utilizado em sopas, peixes, carnes vermelhas e frango. Por serem fibrosas, suas folhas não devem ser ingeridas cruas, e mesmo cozida, é recomendado que seja retirada antes do consumo",
                  cultivation: "O loureiro é uma árvore que se adapta a regiões de clima temperado e subtropical. Embora seja considerada uma planta perene, é necessário realizar seu replantio quando o ressecamento leva-a à morte. Prefere solos ricos em matéria orgânica, com boa drenagem e luminosidade.", image: UIImage(named: "louro")!)


let cebolinha = Spice(name: "Cebolinha",
                      description: "Suas folhas frescas têm um agradável e suave sabor parecido com o da cebola. Na cozinha brasileira, a cebolinha é muito utilizada em saladas cruas e como tempero de tortas salgadas.",
                      usage: "A cebolinha pode ser muito versatil: tanto na elaboração de pratos, como sopas, omeletes e purês, mas também como tempero básico. Deve-se utliza-la fresca sempre que for possível e/ou adicioná-la apenas no final da preparação. É possível utilizar não só as folhas, mas também os talos.",
                      cultivation: "A cebolinha é pode ser cultivada dentro de casa pois cresce facilmente em jardineiras e vasos, a partir de mudas ou sementes. Exige bastante água e necessita muita luz, porém não resiste ao calor excessivo. Para que voltem a brotar, deixe sempre 1/3 do comprimento das folhas ao colher.",
                      image: UIImage(named: "cebolinha")!)
//let cominho = Spice()
