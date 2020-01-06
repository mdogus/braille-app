//
//  DoubleLetterContract.swift
//  BrailleQuiz
//
//  Created by MUSTAFA DOĞUŞ on 17.11.2019.
//  Copyright © 2019 MUSTAFA DOĞUŞ. All rights reserved.
//

import Foundation
import GameplayKit

func getRandomCaseForDouble(_ array: [DoubleLetterContract]) -> DoubleLetterContract {
    let randomIndex = GKRandomDistribution(lowestValue: 0, highestValue: (array.count) - 1)
    let index = randomIndex.nextInt()
    return array[index]
}

let doubleLetterContracts: [DoubleLetterContract] = [.bd, .bğ, .bl, .bn, .br, .bs, .bş, .bt, .by, .bz, .cm, .cs, .cv, .çc, .çğ, .çl, .çn, .çş, .çv, .dğ, .dl, .dm, .dn, .dv, .fz, .gb, .gc, .gn, .gz, .hb, .hç, .hl, .hm, .hn, .hp, .hy, .hz, .kb, .kç, .kd, .kh, .kl, .kn, .ks, .kt, .kv, .kz, .lz, .md, .ml, .mm, .nc, .nç, .nd, .nh, .nn, .ns, .rk, .rn, .rs, .rt, .sb, .sc, .sğ, .sk, .sm, .sr, .sv, .şğ, .şh, .şk, .şm, .şt, .şy, .tb, .tp, .vt, .yd, .yk, .yl, .yn, .yr, .yv, .yz, .zl, .zn, .zr]

enum DoubleLetterContract {
    case bd, bğ, bl, bn, br, bs, bş, bt, by, bz,
        cm, cs, cv,
        çc, çğ, çl, çn, çş, çv,
        dğ, dl, dm, dn, dv,
        fz,
        gb, gc, gn, gz,
        hb, hç, hl, hm, hn, hp, hy, hz,
        kb, kç, kd, kh, kl, kn, ks, kt, kv, kz,
        lz,
        md, ml, mm,
        nc, nç, nd, nh, nn, ns,
        rk, rn, rs, rt,
        sb, sc, sğ, sk, sm, sr, sv,
        şğ, şh, şk, şm, şt, şy,
        tb, tp,
        vt,
        yd, yk, yl, yn, yr, yv, yz,
        zl, zn, zr
    
    var word: String {
        switch self {
        case .bd:
            return "beden"
        case .bğ:
            return "bağımsız"
        case .bl:
            return "bilgi"
        case .bn:
            return "bundan"
        case .br:
            return "beraber"
        case .bs:
            return "basit"
        case .bş:
            return "başka"
        case .bt:
            return "bütün"
        case .by:
            return "böyle"
        case .bz:
            return "bazı"
        case .cm:
            return "cumhuriyet"
        case .cs:
            return "cisim"
        case .cv:
            return "cevap"
        case .çc:
            return "çocuk"
        case .çğ:
            return "çoğu"
        case .çl:
            return "çalışkan"
        case .çn:
            return "çünkü"
        case .çş:
            return "çeşit"
        case .çv:
            return "çevre"
        case .dğ:
            return "değil"
        case .dl:
            return "dolayı"
        case .dm:
            return "demek"
        case .dn:
            return "deney"
        case .dv:
            return "devlet"
        case .fz:
            return "fazla"
        case .gb:
            return "gibi"
        case .gc:
            return "gece"
        case .gn:
            return "genel"
        case .gz:
            return "güzel"
        case .hb:
            return "haber"
        case .hç:
            return "hiç"
        case .hl:
            return "halk"
        case .hm:
            return "hemen"
        case .hn:
            return "hangi"
        case .hp:
            return "hepsi"
        case .hy:
            return "hayat"
        case .hz:
            return "hazır"
        case .kb:
            return "kabul"
        case .kç:
            return "küçük"
        case .kd:
            return "kadın"
        case .kh:
            return "kahraman"
        case .kl:
            return "kolay"
        case .kn:
            return "kendi"
        case .ks:
            return "kısım"
        case .kt:
            return "kitap"
        case .kv:
            return "kuvvet"
        case .kz:
            return "kuzey"
        case .lz:
            return "lazım"
        case .md:
            return "madde"
        case .ml:
            return "millet"
        case .mm:
            return "memleket"
        case .nc:
            return "ancak"
        case .nç:
            return "niçin"
        case .nd:
            return "Anadolu"
        case .nh:
            return "nehir"
        case .nn:
            return "anne"
        case .ns:
            return "insan"
        case .rk:
            return "arka"
        case .rn:
            return "örneğin"
        case .rs:
            return "arası"
        case .rt:
            return "orta"
        case .sb:
            return "sebep"
        case .sc:
            return "sıcak"
        case .sğ:
            return "soğuk"
        case .sk:
            return "eski"
        case .sm:
            return "Osmanlı"
        case .sr:
            return "soru"
        case .sv:
            return "savaş"
        case .şğ:
            return "aşağı"
        case .şh:
            return "şehir"
        case .şk:
            return "şekil"
        case .şm:
            return "şimdi"
        case .şt:
            return "işte"
        case .şy:
            return "şöyle"
        case .tb:
            return "tabiat"
        case .tp:
            return "toprak"
        case .vt:
            return "vatan"
        case .yd:
            return "aydın"
        case .yk:
            return "yukarı"
        case .yl:
            return "yalnız"
        case .yn:
            return "yeni"
        case .yr:
            return "yarar"
        case .yv:
            return "yavaş"
        case .yz:
            return "yüzyıl"
        case .zl:
            return "özel"
        case .zn:
            return "uzun"
        case .zr:
            return "üzere"
        }
    }
    
    var sign: String {
        switch self {
        case .bd:
            return "bd"
        case .bğ:
            return "bğ"
        case .bl:
            return "bl"
        case .bn:
            return "bn"
        case .br:
            return "br"
        case .bs:
            return "bs"
        case .bş:
            return "bş"
        case .bt:
            return "bt"
        case .by:
            return "by"
        case .bz:
            return "bz"
        case .cm:
            return "cm"
        case .cs:
            return "cs"
        case .cv:
            return "cv"
        case .çc:
            return "çc"
        case .çğ:
            return "çğ"
        case .çl:
            return "çl"
        case .çn:
            return "çn"
        case .çş:
            return "çş"
        case .çv:
            return "çv"
        case .dğ:
            return "dğ"
        case .dl:
            return "dl"
        case .dm:
            return "dm"
        case .dn:
            return "dn"
        case .dv:
            return "dv"
        case .fz:
            return "fz"
        case .gb:
            return "gb"
        case .gc:
            return "gc"
        case .gn:
            return "gn"
        case .gz:
            return "gz"
        case .hb:
            return "hb"
        case .hç:
            return "hç"
        case .hl:
            return "hl"
        case .hm:
            return "hö"
        case .hn:
            return "hn"
        case .hp:
            return "hp"
        case .hy:
            return "hy"
        case .hz:
            return "hz"
        case .kb:
            return "kb"
        case .kç:
            return "kç"
        case .kd:
            return "kd"
        case .kh:
            return "kh"
        case .kl:
            return "kl"
        case .kn:
            return "kn"
        case .ks:
            return "ks"
        case .kt:
            return "kt"
        case .kv:
            return "kv"
        case .kz:
            return "kz"
        case .lz:
            return "lz"
        case .md:
            return "md"
        case .ml:
            return "ml"
        case .mm:
            return "mm"
        case .nc:
            return "nc"
        case .nç:
            return "nç"
        case .nd:
            return "nd"
        case .nh:
            return "nh"
        case .nn:
            return "nn"
        case .ns:
            return "ns"
        case .rk:
            return "rk"
        case .rn:
            return "rn"
        case .rs:
            return "rs"
        case .rt:
            return "rt"
        case .sb:
            return "sb"
        case .sc:
            return "sc"
        case .sğ:
            return "sğ"
        case .sk:
            return "sk"
        case .sm:
            return "sm"
        case .sr:
            return "sr"
        case .sv:
            return "sv"
        case .şğ:
            return "şğ"
        case .şh:
            return "şh"
        case .şk:
            return "şk"
        case .şm:
            return "şm"
        case .şt:
            return "şt"
        case .şy:
            return "şy"
        case .tb:
            return "tb"
        case .tp:
            return "tp"
        case .vt:
            return "vt"
        case .yd:
            return "yd"
        case .yk:
            return "yk"
        case .yl:
            return "yl"
        case .yn:
            return "yn"
        case .yr:
            return "yr"
        case .yv:
            return "yv"
        case .yz:
            return "yz"
        case .zl:
            return "zl"
        case .zn:
            return "zn"
        case .zr:
            return "zr"
        }
    }
}

