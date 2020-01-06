//
//  SingleLetterContract.swift
//  BrailleQuiz
//
//  Created by MUSTAFA DOĞUŞ on 3.11.2019.
//  Copyright © 2019 MUSTAFA DOĞUŞ. All rights reserved.
//

import Foundation
import GameplayKit

func getRandomCaseForSingle(_ array: [SingleLetterContract]) -> SingleLetterContract {
    let randomIndex = GKRandomDistribution(lowestValue: 0, highestValue: (array.count) - 1)
    let index = randomIndex.nextInt()
    return array[index]
}

let singleLetterContracts: [SingleLetterContract] = [.a, .b, .c, .ç, .d, .e, .f, .g, .ğ, .h, .ı, .i, .j, .k, .l, .m, .n, .ö, .p, .r, .s, .ş, .t, .u, .ü, .v, .y, .z]

let singleLetterContractSigns = ["a", "b", "c", "ç", "d", "e", "f", "g", "ğ", "h", "ı", "i", "j", "k", "l", "m", "n", "ö", "p", "r", "s", "ş", "t", "u", "ü", "v", "y", "z"]

enum SingleLetterContract {
    case a, b, c, ç, d, e, f, g, ğ, h, ı, i, j, k, l, m, n, ö, p, r, s, ş, t, u, ü, v, y, z
    
    var word: String {
        switch self {
        case .a:
            return "aynı"
        case .b:
            return "büyük"
        case .c:
            return "can"
        case .ç:
            return "çok"
        case .d:
            return "daha"
        case .e:
            return "ekonomi"
        case .f:
            return "fakat"
        case .g:
            return "göre"
        case .ğ:
            return "eğer"
        case  .h:
            return "her"
        case .ı:
            return "kısa"
        case .i:
            return "için"
        case .j:
            return "gün"
        case .k:
            return "kadar"
        case .l:
            return "ilgi"
        case .m:
            return "meydan"
        case .n:
            return "neden"
        case .ö:
            return "öyle"
        case .p:
            return "para"
        case .r:
            return "artık"
        case .s:
            return "sonra"
        case .ş:
            return "şey"
        case .t:
            return "taraf"
        case .u:
            return "uygun"
        case .ü:
            return "dünya"
        case .v:
            return "var"
        case .y:
            return "yok"
        case .z:
            return "zaman"
        }
    }
    
    var sign: String {
        switch self {
        case .a:
            return "a"
        case .b:
            return "b"
        case .c:
            return "c"
        case .ç:
            return "ç"
        case .d:
            return "d"
        case .e:
            return "e"
        case .f:
            return "f"
        case .g:
            return "g"
        case .ğ:
            return "ğ"
        case  .h:
            return "h"
        case .ı:
            return "ı"
        case .i:
            return "i"
        case .j:
            return "j"
        case .k:
            return "k"
        case .l:
            return "l"
        case .m:
            return "m"
        case .n:
            return "n"
        case .ö:
            return "ö"
        case .p:
            return "p"
        case .r:
            return "r"
        case .s:
            return "s"
        case .ş:
            return "ş"
        case .t:
            return "t"
        case .u:
            return "u"
        case .ü:
            return "ü"
        case .v:
            return "v"
        case .y:
            return "y"
        case .z:
            return "z"
        }
    }
}
