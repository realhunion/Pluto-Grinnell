//
//  Utility.swift
//  Pluto
//
//  Created by Hunain Ali on 4/18/20.
//  Copyright © 2020 BUMP. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import SwiftEntryKit



class BaseTextField: UITextField {
    
    var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 6
        
        self.backgroundColor = UIColor.systemGray.withAlphaComponent(0.2)
        self.textAlignment = NSTextAlignment.left
        self.adjustsFontSizeToFitWidth = true
        self.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension String {
    func stringByRemovingEmoji() -> String {
        return String(self.filter { !$0.isEmoji() })
    }
}

extension Character {
    fileprivate func isEmoji() -> Bool {
        return Character(UnicodeScalar(UInt32(0x1d000))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1f77f))!)
            || Character(UnicodeScalar(UInt32(0x2100))!) <= self && self <= Character(UnicodeScalar(UInt32(0x26ff))!)
    }
}


extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

enum Constant {
    
    static let retro200 = [SampleCardModel(title: "The Beatles", description: "#music", imageURL: URL(string: "https://www.beatlesbible.com/wp/media/beatles-mad-day-out_13.jpg")),
                           SampleCardModel(title: "The Rolling Stones", description: "#music", imageURL: URL(string: "https://66.media.tumblr.com/bbce574155a5fd7f40b88a5643530638/tumblr_mymkd1BMZ81r6sispo1_r1_1280.jpg")),
                           SampleCardModel(title: "Elvis Presley", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Elvis_Presley_Jailhouse_Rock.jpg/1200px-Elvis_Presley_Jailhouse_Rock.jpg")),
                           SampleCardModel(title: "Bob Dylan", description: "#music", imageURL: URL(string: "https://images.genius.com/f5c25eb5996f2f78f7ad8cc3a45d00fe.1000x750x1.jpg")),
                           SampleCardModel(title: "U2", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/18/87/fd/1887fd9a69303bdd151077d559bf28b5.jpg")),
                           SampleCardModel(title: "Bruce Springsteen", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/e9/87/74/e98774a2ef77333dc833f3fb1d00c567.jpg")),
                           SampleCardModel(title: "Madonna", description: "#music", imageURL: URL(string: "https://3.bp.blogspot.com/-iHUXQmYapMg/VPlj8eCtv1I/AAAAAAAAHaw/0Xf19cWn7AM/s1600/madonna-for-tom-munro-photoshoot-3-madonna-let-s-see-what-you-ve-still-got.jpeg")),
                           SampleCardModel(title: "Elton John", description: "#music", imageURL: URL(string: "https://iconicimages.net/app/uploads/2017/01/EJ035.jpg")),
                           SampleCardModel(title: "Michael Jackson", description: "#music", imageURL: URL(string: "https://papers.co/wallpaper/papers.co-hc08-michael-jackson-concert-king-of-pop-40-wallpaper.jpg?download=true")),
                           SampleCardModel(title: "Pink Floyd", description: "#music", imageURL: URL(string: "https://iconicimages.net/app/uploads/2017/01/BW_PF009.jpg")),
                           SampleCardModel(title: "Prince", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/562eaa6ae4b05b1125147be2/1547262760091-XEBVN4OPRYNELJU5DUJK/ke17ZwdGBToddI8pDm48kGWSdQKjlHWYv6-Km_O64AsUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8GRo6ASst2s6pLvNAu_PZdLNSyvILuuIZXttN5iGDlJ68XcSNXCslwDXtpjoF6UQfnWDpg_rM9mH5t3BIXV0L_Q/b0204be647f5af5cf7a86d83013b28bd--prince-purple-rain-heart.jpg")),
                           SampleCardModel(title: "Rod Stewart", description: "#music", imageURL: URL(string: "https://www.gannett-cdn.com/media/Nashville/Nashville/2014/09/18/1411051440001-Rod-Stewart-02.JPG?width=1588")),
                           SampleCardModel(title: "Led Zeppelin", description: "#music", imageURL: URL(string: "https://bloximages.chicago2.vip.townnews.com/kearneyhub.com/content/tncms/assets/v3/editorial/4/3c/43cf2b0c-ec8d-11e9-af4f-b315d7820c2d/5da12888296da.image.jpg")),
                           SampleCardModel(title: "Frank Sinatra", description: "#music", imageURL: URL(string: "https://cdn.britannica.com/20/187920-050-0425AFBB/Frank-Sinatra-1947.jpg")),
                           SampleCardModel(title: "Barbra Streisand", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/en/b/ba/Barbra_Streisand_singing-_1969.jpg")),
                           SampleCardModel(title: "David Bowie", description: "#music", imageURL: URL(string: "https://thefader-res.cloudinary.com/private_images/w_1440,c_limit,f_auto,q_auto:best/GettyImages-92783142_pt323t/how-to-stay-glam-as-fuck-forever-according-to-david-bowie.jpg")),
                           SampleCardModel(title: "Queen", description: "#music", imageURL: URL(string: "https://pmchollywoodlife.files.wordpress.com/2017/09/freddie-mercury-1.jpg?w=774")),
                           SampleCardModel(title: "Bon Jovi", description: "#music", imageURL: URL(string: "https://flashbak.com/wp-content/uploads/2018/04/1983_bon_jovi_1983_s00266.jpg")),
                           SampleCardModel(title: "Celine Dion", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/88/c6/09/88c6096b9d5ce0772da2352aca548c02.jpg")),
                           SampleCardModel(title: "Neil Young", description: "#music", imageURL: URL(string: "https://www.needsomefun.net/wp-content/uploads/2019/02/neil-young-black-and-white-20.jpg")),
                           SampleCardModel(title: "REM", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/rm-rem-43860984-d38c-44fb-bea7-c56403c265c0.jpg")),
                           SampleCardModel(title: "Mariah Carey", description: "#music", imageURL: URL(string: "https://www.instagram.com/p/Bn85Bc4HMZK/media/?size=l")),
                           SampleCardModel(title: "AC/DC", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/5b/e2/aa/5be2aaad4215b0fb5a7c762d51a24ccd.jpg")),
                           SampleCardModel(title: "Bee Gees", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/70/dd/e9/70dde99fad50a4db9ee61ea49f31a4e1.jpg")),
                           SampleCardModel(title: "Santana", description: "#music", imageURL: URL(string: "https://bento.cdn.pbs.org/hostedbento-prod/filer_public/latinmusicusa/Artists/santana_16x9.jpg")),
                           SampleCardModel(title: "Metallica", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/James_Hetfield_2017.jpg/1200px-James_Hetfield_2017.jpg")),
                           SampleCardModel(title: "Eric Clapton", description: "#music", imageURL: URL(string: "https://www.morrisonhotelgallery.com/images/big/Eric%20Clapton%20with%20Sunglasses.jpg")),
                           SampleCardModel(title: "Phil Collins", description: "#music", imageURL: URL(string: "https://www.morrisonhotelgallery.com/images/big/SPS_PHIL%20COLLINS.jpg")),
                           SampleCardModel(title: "Neil Diamond", description: "#music", imageURL: URL(string: "https://images.forwardcdn.com/image/1300x/center/top/images/cropped/gettyimages-636555232-1516743112.jpg")),
                           SampleCardModel(title: "Whitney Houston", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/a/a7/Whitney_Houston_Welcome_Home_Heroes_1_cropped.jpg")),
                           SampleCardModel(title: "Fleetwood Mac", description: "#music", imageURL: URL(string: "https://m.media-amazon.com/images/M/MV5BNDI0Y2FkYzUtNjViZS00YTY0LWFhMjItZDYxY2MyMzVkOTdjXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SY1000_CR0,0,830,1000_AL_.jpg")),
                           SampleCardModel(title: "Abba", description: "#music", imageURL: URL(string: "https://66.media.tumblr.com/28cf422e58e3b0c453ce36a068cbb90b/tumblr_o3quqhWPfR1slfhvyo1_1280.jpg")),
                           SampleCardModel(title: "The Beach Boys", description: "#music", imageURL: URL(string: "https://cdn.britannica.com/28/198728-050-178A6431/The-Beach-Boys-Al-Jardine-Dennis-Wilson-1966.jpg")),
                           SampleCardModel(title: "Pearl Jam", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/85/dc/9f/85dc9f76e06c4802c9f11e50157701b2.jpg")),
                           SampleCardModel(title: "Jimi Hendrix", description: "#music", imageURL: URL(string: "https://cdn.mos.cms.futurecdn.net/Er7f2aS9ukBKBsVfR2Z9uE.jpg")),
                           SampleCardModel(title: "Eagles", description: "#music", imageURL: URL(string: "https://preview.redd.it/bt9ud6vbgnf21.jpg?auto=webp&s=33968d116a75bfd660dc0313dcdc01e93fc3e840")),
                           SampleCardModel(title: "Billy Joel", description: "#music", imageURL: URL(string: "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/billy-joel-express.jpg")),
                           SampleCardModel(title: "Depeche Mode", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/Dm1pD-PXcAApyNR.jpg")),
                           SampleCardModel(title: "Genesis", description: "#music", imageURL: URL(string: "https://cdn.mos.cms.futurecdn.net/3bYWfU3GejxyxBoAtygVFc.jpg")),
                           SampleCardModel(title: "Dire Straits", description: "#music", imageURL: URL(string: "https://guitar.com/wp-content/uploads/2019/08/young-mark-knopfler-red-strat@1050x1400.jpg")),
                           SampleCardModel(title: "Simon & Garfunkel", description: "#music", imageURL: URL(string: "https://www.ft.com/__origami/service/image/v2/images/raw/ftcms%3A7d96b6b4-e736-11e8-8827-ff56e7163c11?source=ig")),
                           SampleCardModel(title: "Paul McCartney", description: "#music", imageURL: URL(string: "https://data.whicdn.com/images/18162522/original.jpg")),
                           SampleCardModel(title: "The Who", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/f4/e4/6f/f4e46f0d521b41a295e9f5418e4b6bb5.jpg")),
                           SampleCardModel(title: "John Lennon", description: "#music", imageURL: URL(string: "https://api.time.com/wp-content/uploads/2015/10/151001-john-lennon-23.jpg?quality=85")),
                           SampleCardModel(title: "Iron Maiden", description: "#music", imageURL: URL(string: "https://www.theplace2.ru/archive/iron_maiden/img/f654629fbbfe68fa2a4e.jpg")),
                           SampleCardModel(title: "Stevie Wonder", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/54/Stevie_Wonder_1973.JPG")),
                           SampleCardModel(title: "Deep Purple", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/07/47/c6/0747c698ebc54a4f335149c3e88c5093.jpg")),
                           SampleCardModel(title: "Sting", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/40/Sting_in_April_2018.jpg")),
                           SampleCardModel(title: "Radiohead", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/00/c7/71/00c7711a4e3e1ef9fd05c59e84b2bb3a.jpg")),
                           SampleCardModel(title: "Nirvana", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/59/Kurt_St_Thomas_1991_cropped.jpg")),
                           SampleCardModel(title: "Van Morrison", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/11/van-morrison-astral-weeks.jpg")),
                           SampleCardModel(title: "Guns n' Roses", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/14/b5/aa/14b5aab6d1f81a43aa1e07b47a3d6c93.jpg")),
                           SampleCardModel(title: "Chicago", description: "#music", imageURL: URL(string: "https://static.stereogum.com/uploads/2016/04/chicago-compressed.jpg")),
                           SampleCardModel(title: "Jethro Tull", description: "#music", imageURL: URL(string: "https://live.staticflickr.com/2752/4374242878_81383d0058_b.jpg")),
                           SampleCardModel(title: "Bryan Adams", description: "#music", imageURL: URL(string: "https://www.theplace2.ru/cache/archive/bryan_adams/img/bryan_adams-gthumb-gwdata1200-ghdata1200-gfitdatamax.jpg")),
                           SampleCardModel(title: "Aerosmith", description: "#music", imageURL: URL(string: "https://www.morrisonhotelgallery.com/images/big/14%20Steven%20Tyler%20of%20Aerosmith,%201986.jpg")),
                           SampleCardModel(title: "Johnny Cash", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/79/84/76/7984762d2e499543506bcaa97a8829df.jpg")),
                           SampleCardModel(title: "Paul Simon", description: "#music", imageURL: URL(string: "https://www.morrisonhotelgallery.com/images/big/10%20Paul%20Simon,%201978.jpg")),
                           SampleCardModel(title: "Bob Marley", description: "#music", imageURL: URL(string: "https://the1a.org/wp-content/uploads/sites/4/2017/07/GettyImages-3259910-683x1024.jpg")),
                           SampleCardModel(title: "Van Halen", description: "#music", imageURL: URL(string: "https://townsquare.media/site/295/files/2019/01/GettyImages-136658770.jpg?w=980&q=75")),
                           SampleCardModel(title: "Janet Jackson", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/e2/fa/9c/e2fa9c680bbf2ae49c85953affbd149c.jpg")),
                           SampleCardModel(title: "Garth Brooks", description: "#music", imageURL: URL(string: "https://media1.fdncms.com/sacurrent/imager/u/original/2527401/garthbrooks1455_6p_cropd.jpg")),
                           SampleCardModel(title: "Andrea Bocelli", description: "#music", imageURL: URL(string: "https://307047-939351-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2019/04/hero-mobil-tour.jpg")),
                           SampleCardModel(title: "Kiss", description: "#music", imageURL: URL(string: "https://www.ft.com/__origami/service/image/v2/images/raw/http%3A%2F%2Fcom.ft.imagepublish.upp-prod-us.s3.amazonaws.com%2Fade583b4-9ccf-11e9-9c06-a4640c9feebb?fit=scale-down&source=next&width=700")),
                           SampleCardModel(title: "Miles Davis", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/dd/af/5b/ddaf5b606acbd29d0db20cedfdaa1358.jpg")),
                           SampleCardModel(title: "The Backstreet Boys", description: "#music", imageURL: URL(string: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fcdn-img.instyle.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F684xflex%2Fpublic%2Fimages%2F2016%2F04%2F040516-backstreet-boys-lead.jpg%3Fitok%3Day44Wa1t")),
                           SampleCardModel(title: "The Police", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/9d/4a/72/9d4a723aaea4813679594f89472b359e.jpg")),
                           SampleCardModel(title: "The Doors", description: "#music", imageURL: URL(string: "https://iscale.iheart.com/catalog/artist/58402")),
                           SampleCardModel(title: "Wings", description: "#music", imageURL: URL(string: "https://paulmccartneypod.files.wordpress.com/2017/07/band-1.jpg?w=1000&h=1000&crop=1")),
                           SampleCardModel(title: "Herb Alpert", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/e/e0/Herb_Alpert_1966.jpg")),
                           SampleCardModel(title: "The Cure", description: "#music", imageURL: URL(string: "https://wallpapercave.com/wp/wp1899621.jpg")),
                           SampleCardModel(title: "Rush", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/b1/38/69/b1386968fb8a78ab3131f0bf99dbbf52.jpg")),
                           SampleCardModel(title: "Oasis", description: "#music", imageURL: URL(string: "https://www.liveabout.com/thmb/UlQbTbdWMKi9mbyJKOkj-4mcdV4=/2883x2162/smart/filters:no_upscale()/51129222-58b8e5665f9b58af5c912c9c.jpg")),
                           SampleCardModel(title: "Peter Gabriel", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/37/80/db/3780db4d42b022b1d69ccebde0c4c9e3.jpg")),
                           SampleCardModel(title: "Def Leppard", description: "#music", imageURL: URL(string: "https://i.pinimg.com/474x/93/d4/de/93d4de14b07af44772e9865bf22b281d.jpg")),
                           SampleCardModel(title: "Lionel Richie", description: "#music", imageURL: URL(string: "https://i.huffpost.com/gen/1201948/thumbs/o-LIONEL-RICHIE-JHER-CURL-570.jpg?4")),
                           SampleCardModel(title: "Alanis Morissette", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2019/12/01/magazine/01mag-morissette-image-02/01mag-morissette-image-02-mobileMasterAt3x.jpg")),
                           SampleCardModel(title: "Cat Stevens", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/rs-27915-catstevens-1800-1386942005.jpg")),
                           SampleCardModel(title: "Johnny Mathis", description: "#music", imageURL: URL(string: "https://images-na.ssl-images-amazon.com/images/I/C1WYETpNAiS._SL1000_.png")),
                           SampleCardModel(title: "Simply Red", description: "#music", imageURL: URL(string: "https://66.media.tumblr.com/56b83726a720ee385880257f11e4b677/tumblr_oxw91msfBF1u6qucvo1_500.jpg")),
                           SampleCardModel(title: "James Last", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/Grand_Gala_du_Disque_in_RAI_Amsterdam._James_Last_Band%2C_Bestanddeelnr_923-3019.jpg")),
                           SampleCardModel(title: "Tina Turner", description: "#music", imageURL: URL(string: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2018%2F01%2Ftina-turner-12.jpg")),
                           SampleCardModel(title: "Elvis Costello", description: "#music", imageURL: URL(string: "https://4.bp.blogspot.com/-Nizlr3i2mK8/UdG9QNUNfII/AAAAAAAAFG8/wW-TS6r1DPs/s1600/Elvis_Costello_f16A.JPG")),
                           SampleCardModel(title: "Tom Petty & The Heartbreakers", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/09/1320_FOB_MIX_Campbell_B.jpg?w=724")),
                           SampleCardModel(title: "George Michael", description: "#music", imageURL: URL(string: "https://www.morrisonhotelgallery.com/images/big/George%20Michael%201988.jpg")),
                           SampleCardModel(title: "Aretha Franklin", description: "#music", imageURL: URL(string: "https://media.newyorker.com/photos/5b76fc414e612448fe8219f2/master/pass/StFelix-ArethaFranklin-2.jpg")),
                           SampleCardModel(title: "Joe Cocker", description: "#music", imageURL: URL(string: "https://www.ft.com/__origami/service/image/v2/images/raw/http%3A%2F%2Fcom.ft.imagepublish.upp-prod-us.s3.amazonaws.com%2Fbaa43ece-6ca5-11e9-a9a5-351eeaef6d84?fit=scale-down&source=next&width=700")),
                           SampleCardModel(title: "Creedence Clearwater Revival", description: "#music", imageURL: URL(string: "https://iscale.iheart.com/catalog/artist/35051")),
                           SampleCardModel(title: "Ray Charles", description: "#music", imageURL: URL(string: "https://hips.hearstapps.com/esq.h-cdn.co/assets/15/17/1429827516-74257065.jpg")),
                           SampleCardModel(title: "Black Sabbath", description: "#music", imageURL: URL(string: "https://www.morrisonhotelgallery.com/images/big/Ozzy%20jpg451.jpg")),
                           SampleCardModel(title: "Supertramp", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/ab/9f/3d/ab9f3d9e2c8d777e3257c47a3414869f.jpg")),
                           SampleCardModel(title: "Donna Summer", description: "#music", imageURL: URL(string: "https://imaging.broadway.com/images/custom/w1470/111475-0.jpg")),
                           SampleCardModel(title: "Mike Oldfield", description: "#music", imageURL: URL(string: "https://www.innerviews.org/inner/oldfield/mo12.jpg")),
                           SampleCardModel(title: "Yes", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/ca/c5/bb/cac5bbe6255577c3dddebaef2c5747bd.jpg")),
                           SampleCardModel(title: "The Pet Shop Boys", description: "#music", imageURL: URL(string: "https://www.metroweekly.com/wp-content/uploads/2020/01/PSB1-Credit-Phil-Fisk.jpg")),
                           SampleCardModel(title: "Meat Loaf", description: "#music", imageURL: URL(string: "https://www.biography.com/.image/t_share/MTE1ODA0OTcxNDQ4Njk4Mzgx/meat-loaf-262383-1-402.jpg")),
                           SampleCardModel(title: "The Moody Blues", description: "#music", imageURL: URL(string: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Frobinseatonjefferson%2Ffiles%2F2017%2F11%2FMoodyBlues12-1200x1214.jpg")),
                           SampleCardModel(title: "The Eurythmics", description: "#music", imageURL: URL(string: "https://cdn.smehost.net/eurythmicscom-ukprod/wp-content/uploads/2018/04/eur-hero-dark.jpg")),
                           SampleCardModel(title: "Barry Manilow", description: "#music", imageURL: URL(string: "https://i.pinimg.com/474x/86/c4/8c/86c48c903a626227456f9454f10520ce--american-artists-teresa.jpg")),
                           SampleCardModel(title: "Diana Ross", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/a7/2b/de/a72bde6705887d11a90ea0f4a4e38cc8.jpg")),
                           SampleCardModel(title: "Sade", description: "#music", imageURL: URL(string: "https://cdn.britannica.com/65/137465-050-0A58A7AB/Sade-album-cover-Soldier-of-Love.jpg")),
                           SampleCardModel(title: "Cliff Richard", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/d7/5c/a3/d75ca32c6d9cb0bec1ff0df7202339f3.jpg")),
                           SampleCardModel(title: "Duran Duran", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/2a/83/e7/2a83e7ac48cafee8b312d6772acd637d.jpg")),
                           SampleCardModel(title: "ZZ Top", description: "#music", imageURL: URL(string: "https://cdn.britannica.com/95/103095-050-45E47ECB/ZZ-Top-Billy-Gibbons-Frank-Beard-Dusty-2003.jpg")),
                           SampleCardModel(title: "John Denver", description: "#music", imageURL: URL(string: "https://www.visithendersonvillenc.org/wp-content/uploads/Ted-Vigil-is-John-Denver-Logo-v1-1.jpg")),
                           SampleCardModel(title: "Andy Williams", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2012/09/27/obituaries/27williamsobit/27williamsobit-superJumbo.jpg")),
                           SampleCardModel(title: "The Beastie Boys", description: "#music", imageURL: URL(string: "https://thenypost.files.wordpress.com/2019/07/beastie2.jpg?quality=80&strip=all&strip=all")),
                           SampleCardModel(title: "Kenny Rogers", description: "#music", imageURL: URL(string: "https://countrymusichalloffame.org/content/uploads/2019/03/Rogers_Kenny.jpg")),
                           SampleCardModel(title: "Electric Light Orchestra", description: "#music", imageURL: URL(string: "https://www.classicrockhistory.com/wp-content/uploads/2018/03/Electric_Light_Orchestra_1986.jpg")),
                           SampleCardModel(title: "Grateful Dead", description: "#music", imageURL: URL(string: "https://1.bp.blogspot.com/-wK2K8jM4m0c/XUJ4Z_djrwI/AAAAAAAAA-g/stiYwbi2Z5gdbBhe-BkP_68mTInfkYLZQCEwYBhgL/s1600/69-08-16-dead2-upgrade.jpg")),
                           SampleCardModel(title: "Earth, Wind & Fire", description: "#music", imageURL: URL(string: "https://resize-parismatch.lanmedia.fr/img/var/news/storage/images/paris-match/culture/musique/maurice-white-s-est-eteint-mercredi-908137/9631939-1-fre-FR/Maurice-White-s-est-eteint-mercredi.jpg")),
                           SampleCardModel(title: "Carpenters", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/dc/Carpenters_-_Nixon_-_Office.png")),
                           SampleCardModel(title: "Linda Ronstadt", description: "#music", imageURL: URL(string: "https://www.morrisonhotelgallery.com/images/big/linda%20ronstadt%201978%2001.jpg")),
                           SampleCardModel(title: "Talking Heads", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/9f/23/9b/9f239b4ab8cc23640dae156216ae7236.jpg")),
                           SampleCardModel(title: "George Harrison", description: "#music", imageURL: URL(string: "https://img.washingtonpost.com/rf/image_1484w/2010-2019/WashingtonPost/2011/10/04/Style/Images/georgeharrison03.jpg?uuid=pWgsaO6-EeC0hVUH8UyoXw")),
                           SampleCardModel(title: "The Smashing Pumpkins", description: "#music", imageURL: URL(string: "https://artist-assets.hubbardradio.com/thesmashingpumpkins-1_v1000.jpg")),
                           SampleCardModel(title: "The Temptations", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/f5/eb/0c/f5eb0cfa1608821e3829c55e2de1ac97.jpg")),
                           SampleCardModel(title: "Tracy Chapman", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/8c/b6/61/8cb6612933b0a9ba0a41dff988d012a1.jpg")),
                           SampleCardModel(title: "Simple Minds", description: "#music", imageURL: URL(string: "https://s3.amazonaws.com/oildale/wp-content/uploads/2018/01/22013132/Simple-Minds-resize-2.jpg")),
                           SampleCardModel(title: "Status Quo", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/f7/f6/4a/f7f64aeb6f39b2b2d54860c193dd246c.jpg")),
                           SampleCardModel(title: "Tom Jones", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/c9/6a/cd/c96acd367e4e7a0a9b935126d8df101c.jpg")),
                           SampleCardModel(title: "The Alan Parsons Project", description: "#music", imageURL: URL(string: "https://yt3.ggpht.com/a/AATXAJw4ZQ8A2WRw6XHaJtOkfucUo77VRvaNoIQFTA=s900-c-k-c0xffffffff-no-rj-mo")),
                           SampleCardModel(title: "Joni Mitchell", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/04/Joni_mitchell_1974.jpg")),
                           SampleCardModel(title: "Alice Cooper", description: "#music", imageURL: URL(string: "https://www.motorcitycomiccon.com/wp-content/uploads/2020/01/AliceCooperHeashot3-e1579634476471.png")),
                           SampleCardModel(title: "The Scorpions", description: "#music", imageURL: URL(string: "https://www.trbimg.com/img-5cb89ec9/turbine/la-1555603142-aark5btkpy-snap-image")),
                           SampleCardModel(title: "Foreigner", description: "#music", imageURL: URL(string: "https://iscale.iheart.com/catalog/artist/35146")),
                           SampleCardModel(title: "Ozzy Osbourne", description: "#music", imageURL: URL(string: "https://www.biography.com/.image/t_share/MTY5ODEzMTM4MzkxMTgxMTE1/ozzy-osbourne-gettyimages-660795784.jpg")),
                           SampleCardModel(title: "Roxy Music", description: "#music", imageURL: URL(string: "https://m.media-amazon.com/images/M/MV5BMDZiY2YyMzEtZTJlNC00NTlmLWFhNDktZWM5YmUwYzg0MWQ4XkEyXkFqcGdeQXVyMjUyNDk2ODc@._V1_SY1000_SX1000_AL_.jpg")),
                           SampleCardModel(title: "Michael Bolton", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/d0/Michael_Bolton_in_1997.jpg")),
                           SampleCardModel(title: "INXS", description: "#music", imageURL: URL(string: "https://i.ebayimg.com/images/g/L4IAAOxy4dNSxBcn/s-l1600.jpg")),
                           SampleCardModel(title: "John Cougar Mellencamp", description: "#music", imageURL: URL(string: "https://dt7v1i9vyp3mf.cloudfront.net/styles/news_large/s3/imagelibrary/C/ClassicTracks_01-0911-QEy.7Gb1sGSGckaaMtYlqLt_WVCkwVXi.jpg")),
                           SampleCardModel(title: "Julio Iglesias", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/48/f0/79/48f0791c997aac877b61daec1ae16d7a.jpg")),
                           SampleCardModel(title: "Leonard Cohen", description: "#music", imageURL: URL(string: "https://maggiejankuloskawriter.files.wordpress.com/2016/11/lc-woods-scaled1000.jpg")),
                           SampleCardModel(title: "James Taylor", description: "#music", imageURL: URL(string: "https://www.morrisonhotelgallery.com/images/big/james1.jpg")),
                           SampleCardModel(title: "Bob Seger & The Silver Bullet Band", description: "#music", imageURL: URL(string: "https://artist-assets.hubbardradio.com/bobsegerthesilverbulletband-1_v1000.jpg")),
                           SampleCardModel(title: "Tom Waits", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/5be0c3faf93fd4563ef7aaa5/1543030300005-E6TPLT6Z4D43JZ5Z10MX/ke17ZwdGBToddI8pDm48kJp_E_LOI-ft6x3AwwQkb5FZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpwf9SrLQlzB2awYtT85FA0ZiZt9MVWfvJF7nlcFs034uVSYlfOolGL-3b0R6Wcwm-Q/TomWaits.jpg")),
                           SampleCardModel(title: "The Kinks", description: "#music", imageURL: URL(string: "https://static.stereogum.com/uploads/2014/09/thekinks-compressed.jpg")),
                           SampleCardModel(title: "Cher", description: "#music", imageURL: URL(string: "https://www.wmagazine.com/wp-content/uploads/2016/12/15/58527284e3d613c03e1e6d44_Cher-marc-costumes-11.jpg?w=640px")),
                           SampleCardModel(title: "James Brown", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/James_Brown_Live_Hamburg_1973_1702730029.jpg/1200px-James_Brown_Live_Hamburg_1973_1702730029.jpg")),
                           SampleCardModel(title: "The Monkees", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/8f/The_Monkees_1966.JPG")),
                           SampleCardModel(title: "Henry Mancini", description: "#music", imageURL: URL(string: "https://www.stripes.com/polopoly_fs/1.19115.1356733730!/image/3424330632.jpg_gen/derivatives/landscape_900/3424330632.jpg")),
                           SampleCardModel(title: "2Pac", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/4d/e9/5d/4de95d06ff91b6c09489272183a213af.jpg")),
                           SampleCardModel(title: "John Williams", description: "#music", imageURL: URL(string: "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/portrait-of-john-williams-bachrach.jpg")),
                           SampleCardModel(title: "Peter Maffay", description: "#music", imageURL: URL(string: "https://www.jesus.de/wp-content/uploads/2020/01/jde_maffay-scaled.jpg")),
                           SampleCardModel(title: "Roxette", description: "#music", imageURL: URL(string: "https://insidepulse.com/wp-content/uploads/2020/01/Roxette-Marie.jpg")),
                           SampleCardModel(title: "Steely Dan", description: "#music", imageURL: URL(string: "https://si.wsj.net/public/resources/images/AR-AK759_DEACON_8S_20150904180010.jpg")),
                           SampleCardModel(title: "Journey", description: "#music", imageURL: URL(string: "https://www.watchmojo.com/uploads/thumbs720/M-RR-Journey-480i60.jpg")),
                           SampleCardModel(title: "Ray Conniff", description: "#music", imageURL: URL(string: "https://artist-assets.hubbardradio.com/ray-conniff-1_v1000.jpg")),
                           SampleCardModel(title: "The Smiths", description: "#music", imageURL: URL(string: "https://songssmiths.files.wordpress.com/2015/05/the-smiths-1985-this-image-was-taken-during-the-shoot-for-the-cover-of-the-queen-is-dead-album-the-smiths-second-lp-release-in-june-1986-by-stephen-wright.jpg")),
                           SampleCardModel(title: "Chris Rea", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2d/Chris_Rea_01_AB.jpg")),
                           SampleCardModel(title: "Beck", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/rs-9305-130202-beck-1-rect-1359835977.jpg?resize=1800,1200&w=1800")),
                           SampleCardModel(title: "Nat King Cole", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/6c/2c/0a/6c2c0a4fb1dbd61153fc1fd94e613067.jpg")),
                           SampleCardModel(title: "Bjork", description: "#music", imageURL: URL(string: "https://www.indiewire.com/wp-content/uploads/2019/03/tjp04.jpg")),
                           SampleCardModel(title: "Chris de Burgh", description: "#music", imageURL: URL(string: "https://www.irishtimes.com/polopoly_fs/1.3047553!/image/image.jpg_gen/derivatives/landscape_620/image.jpg")),
                           SampleCardModel(title: "John Coltrane", description: "#music", imageURL: URL(string: "https://www.blumenthalarts.org/assets/img/John-Coltrane-Primary-blum-1440x1440-min-4de4593127.jpg")),
                           SampleCardModel(title: "Cream", description: "#music", imageURL: URL(string: "https://2.bp.blogspot.com/-chb35bUN2DI/Uk1jLQSeC1I/AAAAAAAATyk/oSM6fVj71Q4/s1600/tumblr_ml7sq3Ve5V1so5ik5o1_1280.jpg")),
                           SampleCardModel(title: "Marvin Gaye", description: "#music", imageURL: URL(string: "https://2ab9pu2w8o9xpg6w26xnz04d-wpengine.netdna-ssl.com/wp-content/uploads/2015/04/Marvin-Gaye-Album-Cover-Crop.jpg")),
                           SampleCardModel(title: "Snoop Dogg", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/DAdVW71XUAAElzL.jpg")),
                           SampleCardModel(title: "Nick Cave & The Bad Seeds", description: "#music", imageURL: URL(string: "https://cultmtl.com/wp-content/uploads/2019/09/Nick-Cave.jpg")),
                           SampleCardModel(title: "Luther Vandross", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/80/d3/68/80d3684fe983cdcadb8f942568127f4e.jpg")),
                           SampleCardModel(title: "Carole King", description: "#music", imageURL: URL(string: "https://troubadourtribune.files.wordpress.com/2012/03/caroleking-nymag-excerpt.jpg")),
                           SampleCardModel(title: "Kate Bush", description: "#music", imageURL: URL(string: "https://rockandrollglobe.com/wp-content/uploads/2019/01/273d1d12fb649d32335dd76d785424f2.jpg")),
                           SampleCardModel(title: "Willie Nelson", description: "#music", imageURL: URL(string: "https://cdn.britannica.com/39/67639-050-81F10048/Willie-Nelson-1992.jpg")),
                           SampleCardModel(title: "Tori Amos", description: "#music", imageURL: URL(string: "https://www.yessaid.com/pic/94-03details1b.jpg"))]
    
    static let gen200 = [SampleCardModel(title: "Eminem", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/d4/a8/bd/d4a8bd35c209214cad0e69694d3fae79.jpg")),
                         SampleCardModel(title: "Pink", description: "#music", imageURL: URL(string: "https://cdn.nashvillescene.com/files/base/scomm/nvs/image/2019/03/960w/PINK_Ryan_Aylsworth_Main_Press.5c7ee014cd2c9.jpg")),
                         SampleCardModel(title: "Taylor Swift", description: "#music", imageURL: URL(string: "https://66.media.tumblr.com/7911d448c43e3aeb442239c159ba808f/tumblr_p7nz3fdKIF1r9hliho1_400.png")),
                         SampleCardModel(title: "Coldplay", description: "#music", imageURL: URL(string: "https://cdn1.thr.com/sites/default/files/2014/05/coldplay_royce_hall_a_p.jpg")),
                         SampleCardModel(title: "Linkin Park", description: "#music", imageURL: URL(string: "https://cdn.vox-cdn.com/thumbor/rK3T3qJKt9TD9tjiQZJNU6RWiIM=/0x144:3000x2000/1400x1400/filters:focal(1587x973:2067x1453):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/55808999/687020280.0.jpg")),
                         SampleCardModel(title: "Rihanna", description: "#music", imageURL: URL(string: "https://abrilcapricho.files.wordpress.com/2017/11/rihanna-batom-vermelho-fenty-beauty-1.jpg?quality=85&strip=info&w=1024")),
                         SampleCardModel(title: "Adele", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/da/dc/66/dadc66bc376458a2127f193d5459fc2a.jpg")),
                         SampleCardModel(title: "Britney Spears", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/5b/e4/bf/5be4bfc52251cb8780ee32c399e3b5aa.jpg")),
                         SampleCardModel(title: "Beyonce", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/7e/28/e1/7e28e11683c3d6ae42c5a7d5fab5f08a.jpg")),
                         SampleCardModel(title: "Nickelback", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/a5/d4/39/a5d439ed48a72c75a61ffeae4e6a3ca5.jpg")),
                         SampleCardModel(title: "Maroon 5", description: "#music", imageURL: URL(string: "https://www.usmagazine.com/wp-content/uploads/2020/02/Adam-Levine-Apologizes-for-Maroon-5%E2%80%99s-%E2%80%98Unprofessional%E2%80%99-Concert-in-Chile.jpg")),
                         SampleCardModel(title: "The Black Eyed Peas", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/j33mc9w2-23372332-4c8d-4847-a3c8-220c9bab2ce8.jpg?resize=1800,1200&w=1800")),
                         SampleCardModel(title: "Kenny Chesney", description: "#music", imageURL: URL(string: "https://iscale.iheart.com/catalog/artist/89602")),
                         SampleCardModel(title: "Tim McGraw", description: "#music", imageURL: URL(string: "https://cdn.britannica.com/94/103094-050-FAA1DA59/Tim-McGraw-2007.jpg")),
                         SampleCardModel(title: "Toby Keith", description: "#music", imageURL: URL(string: "https://media2.s-nbcnews.com/j/msnbc/components/photo/_new/130708-concert-5a.nbcnews-ux-2880-1000.jpg")),
                         SampleCardModel(title: "Alicia Keys", description: "#music", imageURL: URL(string: "https://warddpress.files.wordpress.com/2017/02/alicia-keys-bandana2.jpg")),
                         SampleCardModel(title: "Red Hot Chili Peppers", description: "#music", imageURL: URL(string: "https://www.abc.net.au/cm/rimage/10850008-16x9-large.jpg?v=2")),
                         SampleCardModel(title: "Kelly Clarkson", description: "#music", imageURL: URL(string: "https://divasanddorks.com/wp-content/uploads/2013/02/Kelly-Clarkson-BW-Photoshoot-2.jpg")),
                         SampleCardModel(title: "Usher", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/c3/e1/a0/c3e1a0e836d14ce21dab8793ea99a0e7.jpg")),
                         SampleCardModel(title: "Bruno Mars", description: "#music", imageURL: URL(string: "https://inglam.ru/img/2019/03/Bruno-Mars-Latina-Magazine-2016-002.jpg")),
                         SampleCardModel(title: "Michael Buble", description: "#music", imageURL: URL(string: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2018%2F11%2Fmbuble_cover_2018-2429-retouch-2000.jpg&q=85")),
                         SampleCardModel(title: "Rascal Flatts", description: "#music", imageURL: URL(string: "https://lastfm.freetls.fastly.net/i/u/ar0/b9fe0d5d6cd2454083c2c63a08e4bb60.jpg")),
                         SampleCardModel(title: "Justin Timberlake", description: "#music", imageURL: URL(string: "https://www.sweetandtalented.com/men/images/timberlake/timberlake27.jpg")),
                         SampleCardModel(title: "Destiny's Child", description: "#music", imageURL: URL(string: "https://66.media.tumblr.com/dc4f8084b7390b5d4e4e9fa64a6b12d4/tumblr_phx1g9s8sF1vf6oo5o1_1280.jpg")),
                         SampleCardModel(title: "Avril Lavigne", description: "#music", imageURL: URL(string: "https://celebmafia.com/wp-content/uploads/2019/05/avril-lavigne-photoshoot-for-v-magazine-2019-0.jpg")),
                         SampleCardModel(title: "Norah Jones", description: "#music", imageURL: URL(string: "https://lastfm.freetls.fastly.net/i/u/770x0/fb7c2e77c03d4492a33493a6408a2dc4.jpg")),
                         SampleCardModel(title: "Imagine Dragons", description: "#music", imageURL: URL(string: "https://cdn.i-scmp.com/sites/default/files/styles/768x768/public/d8/images/methode/2019/03/15/1418cdea-46d5-11e9-b5dc-9921d5eb8a6d_image_hires_181503.jpg?itok=u-Wn0yv9&v=1552644908")),
                         SampleCardModel(title: "Nelly", description: "#music", imageURL: URL(string: "https://keyassets-p2.timeincuk.net/wp/prod/wp-content/uploads/sites/30/2017/08/Nelly-port.jpg")),
                         SampleCardModel(title: "Robbie Williams", description: "#music", imageURL: URL(string: "https://www.thesun.co.uk/wp-content/uploads/2016/06/nintchdbpict000247195645.jpg")),
                         SampleCardModel(title: "Christina Aguilera", description: "#music", imageURL: URL(string: "https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Fsundaytimes%2Fprod%2Fweb%2Fbin%2Ff3c90244-e5c1-11e9-ad63-2dc2cb80bbf7.jpg?crop=1300%2C1625%2C0%2C0")),
                         SampleCardModel(title: "Lady Gaga", description: "#music", imageURL: URL(string: "https://hips.hearstapps.com/hbz.h-cdn.co/assets/16/45/1478793201-hbz-lady-gaga-dec-jan-2017-00-index2.jpg")),
                         SampleCardModel(title: "Keith Urban", description: "#music", imageURL: URL(string: "https://data.whicdn.com/images/149296692/original.jpg")),
                         SampleCardModel(title: "Green Day", description: "#music", imageURL: URL(string: "https://dt7v1i9vyp3mf.cloudfront.net/styles/news_large/s3/imagelibrary/C/ClassicTracks_01-0211-dKANrpCPACcpq2Qvt1NT6d84Pzuls91..jpg")),
                         SampleCardModel(title: "Kanye West", description: "#music", imageURL: URL(string: "https://api.time.com/wp-content/uploads/2000/04/kanye-west-time-100-2015-titans.jpg?quality=85&w=1012")),
                         SampleCardModel(title: "Katy Perry", description: "#music", imageURL: URL(string: "https://assets.vogue.com/photos/58e7e6d603410e59b84c182b/master/w_1866,h_2500,c_limit/05-katy-perry-vogue-may-2017-cover-story-photos.jpg")),
                         SampleCardModel(title: "50 Cent", description: "#music", imageURL: URL(string: "https://www.rapbasement.com/wp-content/uploads/2014/09/DB3F8AF56B6A2A3E9FA0270EF1277A2B.jpg")),
                         SampleCardModel(title: "Jennifer Lopez", description: "#music", imageURL: URL(string: "https://data.whicdn.com/images/308483106/original.jpg")),
                         SampleCardModel(title: "Justin Bieber", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/56bb4ae4cdf2db6945d2e49e/master/w_1600%2Cc_limit/justin-bieber-gq-0316-01.jpg")),
                         SampleCardModel(title: "Alan Jackson", description: "#music", imageURL: URL(string: "https://countrymusichalloffame.org/content/uploads/2017/10/Jackson_Alan.jpg")),
                         SampleCardModel(title: "Jay-Z", description: "#music", imageURL: URL(string: "https://i1.wp.com/trapital.co/wp-content/uploads/2019/11/Screen-Shot-2019-11-20-at-1.47.49-PM.png?fit=1716%2C1392&ssl=1")),
                         SampleCardModel(title: "Three Doors Down", description: "#music", imageURL: URL(string: "https://iscale.iheart.com/catalog/artist/36646")),
                         SampleCardModel(title: "Carrie Underwood", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/a9/13/97/a91397063c0966ff9388c67a26c11742.jpg")),
                         SampleCardModel(title: "Shakira", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/7f/Shakira.JPG")),
                         SampleCardModel(title: "George Strait", description: "#music", imageURL: URL(string: "https://cdn.britannica.com/74/172774-050-8C76BD84/CMA-Entertainer-George-Strait.jpg")),
                         SampleCardModel(title: "Miley Cyrus", description: "#music", imageURL: URL(string: "https://www.hawtcelebs.com/wp-content/uploads/2019/03/miley-cyrus-on-the-set-of-a-photoshoot-march-2019-11.jpg")),
                         SampleCardModel(title: "Chris Brown", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/cd/4d/e3/cd4de3b556759d7bf9d98c72dc40f36e.jpg")),
                         SampleCardModel(title: "Creed", description: "#music", imageURL: URL(string: "https://d7hftxdivxxvm.cloudfront.net/?resize_to=width&src=https%3A%2F%2Fartsy-media-uploads.s3.amazonaws.com%2Fckr_-fjeUiNMaW5-6Gc6nw%252FMartin%2BCreed%252C%2BWork%2BNo.%2B2661.jpg&width=1200&quality=80")),
                         SampleCardModel(title: "Nelly Furtado", description: "#music", imageURL: URL(string: "https://2.bp.blogspot.com/-LcN3tOAHSVQ/WUI6gVTEsjI/AAAAAAAAVWA/9fdOfZsmJqgD4rLSGE6D3XCtFqMoS2v-gCLcBGAs/s1600/C_YO4IUW0AAdl09.jpg")),
                         SampleCardModel(title: "Blake Shelton", description: "#music", imageURL: URL(string: "https://static.billboard.com/files/media/06-Blake-Shelton-pol3-fea-bb20-nashville-billboard-1240-compressed.jpg")),
                         SampleCardModel(title: "John Mayer", description: "#music", imageURL: URL(string: "https://freight.cargo.site/t/original/i/6a875bf26a76d0c8c044a8cd3723731376ac54b3da7c15a363e4b073b8dd499b/Steven-Taylor-John-Mayer-4.jpg")),
                         SampleCardModel(title: "The Dixie Chicks", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2019/08/DixieChicks.jpg")),
                         SampleCardModel(title: "Mary J Blige", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/b5/aa/b1/b5aab1077fa8ee6e7d1a8e1db12c2215.jpg")),
                         SampleCardModel(title: "Kid Rock", description: "#music", imageURL: URL(string: "https://bloximages.newyork1.vip.townnews.com/nuvo.net/content/tncms/assets/v3/editorial/a/67/a67479a8-f7c4-560d-a265-51c2997de5be/58bdbea1178f5.image.jpg")),
                         SampleCardModel(title: "Enrique Iglesias", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/e/e7/Enrique_Iglesias%2C_2011.jpg")),
                         SampleCardModel(title: "The Killers", description: "#music", imageURL: URL(string: "https://www.elquintobeatle.com/wp-content/uploads/2018/12/the-killers-2018-1-1068x1072.jpg")),
                         SampleCardModel(title: "Dido", description: "#music", imageURL: URL(string: "https://lastfm.freetls.fastly.net/i/u/ar0/be41bff9f7ba6e93b4d5054352909523.jpg")),
                         SampleCardModel(title: "Brad Paisley", description: "#music", imageURL: URL(string: "https://www.mm-group.org/wp-content/uploads/2016/07/bradpaisley60-1422630460-687x1030.jpg")),
                         SampleCardModel(title: "Amy Winehouse", description: "#music", imageURL: URL(string: "https://www.theplace2.ru/cache/archive/amy_winehouse/img/amy_winehouse_4-gthumb-gwdata1200-ghdata1200-gfitdatamax.jpg")),
                         SampleCardModel(title: "Jack Johnson", description: "#music", imageURL: URL(string: "https://i.dailymail.co.uk/i/pix/2008/08/19/article-1046769-024A73BD00000578-996_468x664.jpg")),
                         SampleCardModel(title: "OutKast", description: "#music", imageURL: URL(string: "https://wallpaperaccess.com/full/1268242.jpg")),
                         SampleCardModel(title: "Jason Aldean", description: "#music", imageURL: URL(string: "https://128dagwixzkuuk9y3guyf7fd-wpengine.netdna-ssl.com/wp-content/uploads/2017/01/web1_k-M-jason-aldean.jpg")),
                         SampleCardModel(title: "Shania Twain", description: "#music", imageURL: URL(string: "https://i.guim.co.uk/img/media/fffd4e13dae017a5699061cdb3c88bc9fb0df61a/0_0_1989_3000/master/1989.jpg?width=700&quality=85&auto=format&fit=max&s=30ad070a75fa8ad4fb411d8d145840c5")),
                         SampleCardModel(title: "Josh Groban", description: "#music", imageURL: URL(string: "https://static.parade.com/wp-content/uploads/2018/09/JG_Suit_037-RETOUCH-2-2500x1662.jpg")),
                         SampleCardModel(title: "The Foo Fighters", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/foo-fighters-congrete-and-gold-review-9506116c-34b2-4619-bace-cf6df4db7bd9.jpg")),
                         SampleCardModel(title: "Faith Hill", description: "#music", imageURL: URL(string: "https://townsquare.media/site/204/files/2017/05/faith-hill-covers-beyonce-live.jpg?w=980&q=75")),
                         SampleCardModel(title: "Evanescence", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/af/5f/45/af5f45b2191498635ee660432096f045.jpg")),
                         SampleCardModel(title: "James Blunt", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/76/James_Blunt_Tom_Brasil_%2825624592027%29.jpg")),
                         SampleCardModel(title: "Luke Bryan", description: "#music", imageURL: URL(string: "https://www.lukebryan.com/templates/default/ptbrh-splash/images/bg-hero.jpg")),
                         SampleCardModel(title: "Fall Out Boy", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/B5W195WCUAAa4Di.jpg")),
                         SampleCardModel(title: "Limp Bizkit", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/06/13-06-09_RiP_Limp_Bizkit_Fred_Durst_1.JPG")),
                         SampleCardModel(title: "Sean Paul", description: "#music", imageURL: URL(string: "https://media.resources.festicket.com/www/artists/SeanPaul.jpg")),
                         SampleCardModel(title: "Ludacris", description: "#music", imageURL: URL(string: "https://res.cloudinary.com/culturemap-com/image/upload/ar_3:4,c_fill,g_faces:center,w_1200/v1493157708/photos/7839_original.jpg")),
                         SampleCardModel(title: "Matchbox Twenty", description: "#music", imageURL: URL(string: "https://images-na.ssl-images-amazon.com/images/G/01/music/artists/Matchboxtwentycolorpub2Hi.jpg")),
                         SampleCardModel(title: "Twenty One Pilots", description: "#music", imageURL: URL(string: "https://www.readdork.com/images/article/Artist-Images/T/Twenty-One-Pilots/Cover%20Shoot%202019/_imageblocks/04DORKFINALFILES-1868-00037.jpg")),
                         SampleCardModel(title: "One Direction", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/de/91/74/de9174b7d3019e32491a95ef3964b7a0.jpg")),
                         SampleCardModel(title: "*NSYNC", description: "#music", imageURL: URL(string: "https://www.usmagazine.com/wp-content/uploads/2018/04/84583505_nsync-zoom.jpg")),
                         SampleCardModel(title: "blink-182", description: "#music", imageURL: URL(string: "https://iscale.iheart.com/v3/url/aHR0cDovL2ltYWdlLmloZWFydC5jb20vaW1hZ2VzL292ZXJyaWRlLzY1NzMuanBn?surrogate=1cOXl179JY-syhxYSCX6Q1a_Mcu6UO8d-F4oJzpZf1hcUbJr4aIjwdYKAQHp1k9NiumkIuwak5ZAuw2rpUZsdRzo35Ev4Dr7MBRqHxJDnV-OAIU0QMGP6f4lTnJSctWNC41zHHAzRNklouLVU647dUTZgTvSsqMlAVy-mbzLevKkx8jzEls2pXM%3D")),
                         SampleCardModel(title: "Train", description: "#music", imageURL: URL(string: "https://www2.pictures.zimbio.com/gi/Train+Performs+On+NBC+s+Today+qWN6lNEIS_px.jpg")),
                         SampleCardModel(title: "Zac Brown Band", description: "#music", imageURL: URL(string: "https://img.srgcdn.com/e//azU5WGtIUFN5SmFmdVQxMUxReGEuanBn.jpg")),
                         SampleCardModel(title: "Gwen Stefani", description: "#music", imageURL: URL(string: "https://www.theplace2.ru/cache/archive/gwen_stefani/img/30097795143_368cab4f4a_o-gthumb-gwdata1200-ghdata1200-gfitdatamax.jpg")),
                         SampleCardModel(title: "Kylie Minogue", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/7b/7b/29/7b7b29c588cd2edc4bc48db4657da551.jpg")),
                         SampleCardModel(title: "Gorillaz", description: "#music", imageURL: URL(string: "https://pm1.narvii.com/6905/c99c26f59df3c361aae6ce64f89453e270c02e79r1-996-1245v2_hq.jpg")),
                         SampleCardModel(title: "Akon", description: "#music", imageURL: URL(string: "https://htc-wallpaper.com/wp-content/uploads/2013/10/Akon1.jpg")),
                         SampleCardModel(title: "Muse", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/6e/01/71/6e0171e79055408e14842d6896a9b9c1.jpg")),
                         SampleCardModel(title: "Lenny Kravitz", description: "#music", imageURL: URL(string: "https://cdn1.thr.com/sites/default/files/2018/01/lenny_kravitz_-_p_2018.jpg")),
                         SampleCardModel(title: "Enya", description: "#music", imageURL: URL(string: "https://api.song-data.com/img/artist/scale/1500x1500/5018/Enya.jpg")),
                         SampleCardModel(title: "Helene Fischer", description: "#music", imageURL: URL(string: "https://www.helene-fischer.de/sites/default/files/styles/news_gross/public/news/KRISTIAN_SCHULLER_HELENE_FISCHER_RGB.jpg")),
                         SampleCardModel(title: "Disturbed", description: "#music", imageURL: URL(string: "https://thecollegiatelive.com/wp-content/uploads/2016/04/Disturbed-230-Copy-Copy-1-2.jpg")),
                         SampleCardModel(title: "Staind", description: "#music", imageURL: URL(string: "https://townsquare.media/site/366/files/2017/08/Staind-2.jpg")),
                         SampleCardModel(title: "Ashanti", description: "#music", imageURL: URL(string: "https://celebmafia.com/wp-content/uploads/2016/05/ashanti-private-shoot-at-london-hotel-in-west-hollywood-april-2016-1.jpg")),
                         SampleCardModel(title: "Kings of Leon", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/rs-kol-01-acb78856-56e0-4e75-96ee-ffae822da9c3.jpg")),
                         SampleCardModel(title: "Missy 'Misdemeanor' Elliott", description: "#music", imageURL: URL(string: "https://www.biography.com/.image/t_share/MTQ3NTI2NjI2OTExOTg3MzI4/missy_elliot_photo_by_the_gap_getty_images_entertainment_getty_2370945.jpg")),
                         SampleCardModel(title: "Mumford & Sons", description: "#music", imageURL: URL(string: "https://www.nme.com/wp-content/uploads/2019/10/Mumford-Sons-2019.jpg")),
                         SampleCardModel(title: "T.I.", description: "#music", imageURL: URL(string: "https://media3.s-nbcnews.com/i/newscms/2019_48/3118136/191125-ti-cs-1144a_3606f325133a5109c27e221186a2726b.jpg")),
                         SampleCardModel(title: "Lady Antebellum", description: "#music", imageURL: URL(string: "https://vegasmagazine.com/get/files/image/galleries/Lady_Antebellum_Vegas.jpg")),
                         SampleCardModel(title: "Anastacia", description: "#music", imageURL: URL(string: "https://edge-ent.com/wp-content/uploads/2020/02/Anastacia-scaled-e1581687830347.jpg")),
                         SampleCardModel(title: "Brooks & Dunn", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/2a/fb/2f/2afb2f1ac3422e20fb7ca7f67e6277aa.jpg")),
                         SampleCardModel(title: "The Pussycat Dolls", description: "#music", imageURL: URL(string: "https://i.dailymail.co.uk/1s/2020/02/06/19/24407330-0-image-a-17_1581016581481.jpg")),
                         SampleCardModel(title: "System of A Down", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/07/system-of-a-down-2002.jpg")),
                         SampleCardModel(title: "Lonestar", description: "#music", imageURL: URL(string: "https://ridgefieldplayhouse.org/wp-content/uploads/2019/02/Lonestar-Featured.jpg")),
                         SampleCardModel(title: "Martina McBride", description: "#music", imageURL: URL(string: "https://www.opry.com/wp-content/uploads/sites/8/2019/08/martina-mcbride-thumbnail-2019.jpg")),
                         SampleCardModel(title: "Moby", description: "#music", imageURL: URL(string: "https://media.npr.org/assets/img/2014/01/03/moby_wide-6925d50d9bc088596fd4d7e57c24f6131c25e797.jpg?s=1400")),
                         SampleCardModel(title: "Florida Georgia Line", description: "#music", imageURL: URL(string: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/lede-1585157988.jpg")),
                         SampleCardModel(title: "Snow Patrol", description: "#music", imageURL: URL(string: "https://lh3.googleusercontent.com/proxy/lACmmubhEUn13fEO9fOuhYHKUS1XXpaSsaADJ14JR0jVho50VR_Co8YqWYmPEOoDnrJB_vzXfootOH6gE2MBD75sZ-ACips4s3JuF1nz4H5SIoTMLtQ")),
                         SampleCardModel(title: "Aaliyah", description: "#music", imageURL: URL(string: "https://www.biography.com/.image/t_share/MTE4MDAzNDEwNzY0OTg5OTY2/aaliyah-4-raw.jpg")),
                         SampleCardModel(title: "Dierks Bentley", description: "#music", imageURL: URL(string: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2018%2F04%2Fdb-womanamensinglenotext-2000.jpg&q=85")),
                         SampleCardModel(title: "No Doubt", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/EQDtP_JU8AA-XLp.jpg")),
                         SampleCardModel(title: "Lana Del Rey", description: "#music", imageURL: URL(string: "https://cdn1.umg3.net/89/files/2014/06/110722_LanaDelRey_10-002-ret-SMALLER.jpg")),
                         SampleCardModel(title: "OneRepublic", description: "#music", imageURL: URL(string: "https://wallpapercave.com/wp/wp5125157.jpg")),
                         SampleCardModel(title: "Sugarland", description: "#music", imageURL: URL(string: "https://communityimpact.com/wp-content/uploads/2018/06/SL_PHOTO_0100_SLainez_JPD1035_STS_FNL.jpg")),
                         SampleCardModel(title: "Korn", description: "#music", imageURL: URL(string: "https://cdn.mos.cms.futurecdn.net/EHKAXnTfxe57SXpcRo8tad.jpg")),
                         SampleCardModel(title: "Ne-Yo", description: "#music", imageURL: URL(string: "https://www.grammy.com/sites/com/files/styles/image_landscape_hero/public/muzooka/Ne-Yo/Ne-Yo_16_9_1578385363.jpg?itok=06KlaVGs")),
                         SampleCardModel(title: "Sheryl Crow", description: "#music", imageURL: URL(string: "https://www.theplace2.ru/archive/sheryl_crow/img/sheryl3.jpg")),
                         SampleCardModel(title: "Dave Matthews Band", description: "#music", imageURL: URL(string: "https://d.newsweek.com/en/full/1064025/dave-matthews-band.jpg")),]
    
    static let spotify600 = [SampleCardModel(title: "Post Malone", description: "#music", imageURL: URL(string: "https://dazedimg-dazedgroup.netdna-ssl.com/1080/azure/dazed-prod/1250/4/1254317.jpg")),
                             SampleCardModel(title: "Drake", description: "#music", imageURL: URL(string: "https://media.resources.festicket.com/www/artists/Drake.jpg")),
                             SampleCardModel(title: "XXXTENTACION", description: "#music", imageURL: URL(string: "https://i.redd.it/xh8qdsmmio2z.jpg")),
                             SampleCardModel(title: "Billie Eilish", description: "#music", imageURL: URL(string: "https://i.pinimg.com/564x/38/71/b8/3871b8b9bbd4f4f2357d36f95d2a2188.jpg")),
                             SampleCardModel(title: "Juice WRLD", description: "#music", imageURL: URL(string: "https://dazedimg-dazedgroup.netdna-ssl.com/600/azure/dazed-prod/1280/1/1281173.jpg")),
                             SampleCardModel(title: "Khalid", description: "#music", imageURL: URL(string: "https://images.hdqwalls.com/download/khalid-iw-1125x2436.jpg")),
                             SampleCardModel(title: "Travis Scott", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/ac/46/de/ac46dea7fda7592582509602e0950356.jpg")),
                             SampleCardModel(title: "Lil Uzi Vert", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/5d7a6ef69f076b0008f2c802/master/w_1600%2Cc_limit/lil-uzi-the-enormous-appetites-of-lil-uzi-vert-gq-october-2019-07.jpg")),
                             SampleCardModel(title: "Ariana Grande", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/4c/91/f8/4c91f8c67f06985a70439a6717a3ec42.jpg")),
                             SampleCardModel(title: "Kendrick Lamar", description: "#music", imageURL: URL(string: "https://i.redd.it/uyej6gw9pjry.jpg")),
                             SampleCardModel(title: "Migos", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/11/ea/da/11eadac3f869f16d06762979bb262354.jpg")),
                             SampleCardModel(title: "Ed Sheeran", description: "#music", imageURL: URL(string: "https://free2music.com/images/singer/2018/11/07/ed-sheeran_1.jpg")),
                             SampleCardModel(title: "The Weeknd", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/EUYIwiwUUAEvrT3.jpg")),
                             SampleCardModel(title: "Lil Baby", description: "#music", imageURL: URL(string: "https://thefader-res.cloudinary.com/private_images/w_1440,c_limit,f_auto,q_auto:best/image2_1_nycz6e/lil-baby-harder-than-ever-yes-indeed-interview.jpg")),
                             SampleCardModel(title: "Cardi B", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/da/1d/38/da1d38945ff15a1e57874df6a4aa72a8.jpg")),
                             SampleCardModel(title: "Kodak Black", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2016/06/23/arts/23KODAKBLACK/23KODAKBLACK-superJumbo.jpg")),
                             SampleCardModel(title: "J. Cole", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/f7/e4/dd/f7e4dd5c19315b87342088571896f241.jpg")),
                             SampleCardModel(title: "Future", description: "#music", imageURL: URL(string: "https://celebrityinsider.org/wp-content/uploads/2020/02/Future-Eliza-Reign-Lawsuit-Social-Media.jpg")),
                             SampleCardModel(title: "21 Savage", description: "#music", imageURL: URL(string: "https://media.newyorker.com/photos/5c59bb60e2fabe1577c2e1c1/master/w_1600%2Cc_limit/Younger-21SavageArrest.jpg")),
                             SampleCardModel(title: "The Chainsmokers", description: "#music", imageURL: URL(string: "https://www.chicagotribune.com/resizer/5IVy0kKk-6Up17zJ2QMdxgFSw9A=/1200x1500/top/arc-anglerfish-arc2-prod-tronc.s3.amazonaws.com/public/PNRAPBXHAVGZZM5ZGOE5U2JEDU.jpg")),
                             SampleCardModel(title: "A Boogie Wit da Hoodie", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/d6/A_Boogie_Wit_da_Hoodie_2017_November.jpg")),
                             SampleCardModel(title: "Logic", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/fb/d7/8e/fbd78e83aea96ce9fad83d89f9487512.jpg")),
                             SampleCardModel(title: "Marshmello", description: "#music", imageURL: URL(string: "https://3.bp.blogspot.com/-7i6ZjIPWEIA/XH_74V9TDXI/AAAAAAAADU8/2FjhiIa2AxwH-MAgx2rWLpTV-FDqYrytwCKgBGAs/w2048-h2732-c/fortnite-br-marshmello-uhdpaper.com-4K-84.jpg")),
                             SampleCardModel(title: "DaBaby", description: "#music", imageURL: URL(string: "https://images.thefacecdn.com/images/ED001_DABABY_WEB_1.jpg?fit=crop&crop=focalpoint&fp-x=0.5&fp-y=0.5&w=1180")),
                             SampleCardModel(title: "Young Thug", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/56c39f0b480eac5d29f2ebe6/master/pass/young-thug-square.jpg")),
                             SampleCardModel(title: "Halsey", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/75/15/53/751553b3531b77011d1933ad0fca0dbf.jpg")),
                             SampleCardModel(title: "Lil Nas X", description: "#music", imageURL: URL(string: "https://api.time.com/wp-content/uploads/2019/08/lil-nas-x-lede-social.jpg?quality=85")),
                             SampleCardModel(title: "Shawn Mendes", description: "#music", imageURL: URL(string: "https://www.j-14.com/wp-content/uploads/2019/02/is-shawn-mendes-single-dating-love-life.jpg?fit=3638%2C2341")),
                             SampleCardModel(title: "Camila Cabello", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/8c/37/5e/8c375e48f2ef293fc67369099bfafc6c.jpg")),
                             SampleCardModel(title: "YNW Melly", description: "#music", imageURL: URL(string: "https://images.complex.com/complex/images/c_scale,f_auto,q_auto,w_1920/fl_lossy,pg_1/o8gjpqchifc2gzso7uls/ynw-melly-david-cabrera-lead")),
                             SampleCardModel(title: "6ix9ine", description: "#music", imageURL: URL(string: "https://i.guim.co.uk/img/media/0b437608be961daf640bd75ca4e4e3a6e1483ae9/0_53_3000_1800/master/3000..jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=a243cc19dc3799f7fec21e73c0cd5ace")),
                             SampleCardModel(title: "Lil Skies", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/6/66/Lil_skiess.jpg")),
                             SampleCardModel(title: "Trippie Redd", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/a/ac/Trippie_Redd_Photo_by_Kris_Knesel.jpg")),
                             SampleCardModel(title: "Bad Bunny", description: "#music", imageURL: URL(string: "https://www.interviewmagazine.com/wp-content/uploads/2019/05/Interview_2019_Web_Summer_BadBunny-05.jpg")),
                             SampleCardModel(title: "Bazzi", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/c7/bc/23/c7bc239a4b8e386637479c313cddfca5.jpg")),
                             SampleCardModel(title: "DJ Khaled", description: "#music", imageURL: URL(string: "https://api.time.com/wp-content/uploads/2016/05/dj-khaled-helps-millenials-through-snapchat.jpg")),
                             SampleCardModel(title: "Gucci Mane", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/D4NdRnzUwAsbOhU.jpg")),
                             SampleCardModel(title: "Roddy Ricch", description: "#music", imageURL: URL(string: "https://thefader-res.cloudinary.com/private_images/w_1440,c_limit,f_auto,q_auto:best/IMGP2241_tx5ked/roddy-ricch-feed-tha-streets-meek-mill-interview.jpg")),
                             SampleCardModel(title: "Lauv", description: "#music", imageURL: URL(string: "https://video-images.vice.com/articles/5d42e91445eba80008390259/lede/1564667728307-Lauv-fuck-im-lonely-Press-Select-1-Photo-Cred-Chris-Noltehuhlmann.jpeg?crop=1xw%3A0.3745xh%3B0xw%2C0.2328xh&resize=2000%3A*")),
                             SampleCardModel(title: "Sam Smith", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2020/03/10501076fyW.jpg")),
                             SampleCardModel(title: "Offset", description: "#music", imageURL: URL(string: "https://c0.wallpaperflare.com/preview/16/576/1014/migos.jpg")),
                             SampleCardModel(title: "Lil Tecca", description: "#music", imageURL: URL(string: "https://audibletreats.com/wp-content/uploads/2019/05/000022770008-e1567008621169.jpeg")),
                             SampleCardModel(title: "Selena Gomez", description: "#music", imageURL: URL(string: "https://www.hawtcelebs.com/wp-content/uploads/2017/06/selena-gomez-on-the-set-of-a-photoshoot-in-new-york-06-05-2017_3.jpg")),
                             SampleCardModel(title: "Calvin Harris", description: "#music", imageURL: URL(string: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fhughmcintyre%2Ffiles%2F2017%2F02%2FPress-Shot-2017-1200x975.jpg")),
                             SampleCardModel(title: "Lizzo", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2019/12/Lizzo-1.jpg")),
                             SampleCardModel(title: "Dan + Shay", description: "#music", imageURL: URL(string: "https://www.gannett-cdn.com/presto/2019/10/04/PNAS/fc422a6d-4dec-4b0f-a60c-4bbd9bc6b5ef-bieber_dan_and_shay.jpg?crop=3352,1886,x0,y1570&width=3200&height=1680&fit=bounds")),
                             SampleCardModel(title: "Dua Lipa", description: "#music", imageURL: URL(string: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2020%2F04%2F21%2Fdua-lipa-1-1.jpg&q=85")),
                             SampleCardModel(title: "Zedd", description: "#music", imageURL: URL(string: "https://www.grammy.com/sites/com/files/styles/image_landscape_hero/public/muzooka/Zedd/Zedd_16_9_1581551807.jpg?itok=uZYfMbOl")),
                             SampleCardModel(title: "Luke Combs", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2019/11/191025_IanBates_-177W.jpg")),
                             SampleCardModel(title: "Big Sean", description: "#music", imageURL: URL(string: "https://wallpapercave.com/wp/wp1879740.jpg")),
                             SampleCardModel(title: "Harry Styles", description: "#music", imageURL: URL(string: "https://images.thefacecdn.com/images/ED001_MASTERCROPS_Harry.jpg?fit=crop&crop=focalpoint&fp-x=0.4338&fp-y=0.233&w=1180")),
                             SampleCardModel(title: "Rae Sremmurd", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/d6/Rae_Sremmurd.jpg")),
                             SampleCardModel(title: "Bebe Rexha", description: "#music", imageURL: URL(string: "https://www.celebsfirst.com/wp-content/uploads/2017/05/bebe-rexha-tmrw-magazine-vol17-photoshoot_2.jpg")),
                             SampleCardModel(title: "G-Eazy", description: "#music", imageURL: URL(string: "https://img.discogs.com/h52XN43pnAHdfQCJ1JAyM2OjoqM=/600x899/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-2875151-1546926502-6565.jpeg.jpg")),
                             SampleCardModel(title: "Rich The Kid", description: "#music", imageURL: URL(string: "https://www.bet.com/music/2020/03/16/21-questions-with-rich-the-kid--the-boss-man/_jcr_content/bodycopycontainer/listiclecontainer/listicleitem_16/embedded_image/image.custom1200x1800.dimg/__1584367123944__1584315831773/031320-social-talent-visit-Rich-The-Kid-fullres-06.jpg")),
                             SampleCardModel(title: "Meek Mill", description: "#music", imageURL: URL(string: "https://wallpapercave.com/wp/wp1967332.jpg")),
                             SampleCardModel(title: "benny blanco", description: "#music", imageURL: URL(string: "https://lastfm.freetls.fastly.net/i/u/770x0/d140439c1f5512a6d1ff983764f86f41.jpg")),
                             SampleCardModel(title: "French Montana", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/e/e9/FM_PRESS03-A.png")),
                             SampleCardModel(title: "Lil Wayne", description: "#music", imageURL: URL(string: "https://nyppagesix.files.wordpress.com/2019/12/191224-lil-wayne-plane.jpg?quality=80&strip=all")),
                             SampleCardModel(title: "Mustard", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/565dfd5c49ad37bf78161b3a/master/pass/dj-mustard-gq-01.jpg")),
                             SampleCardModel(title: "Luis Fonsi", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/a/a8/Luis_Fonsi_La_Voz_US_2019.jpg")),
                             SampleCardModel(title: "Lil Mosey", description: "#music", imageURL: URL(string: "https://cdn-sidewalkhustle.netdna-ssl.com/wp-content/uploads/2019/04/lilmosey-drew-sidewalk-1.jpg")),
                             SampleCardModel(title: "Childish Gambino", description: "#music", imageURL: URL(string: "https://www.grammy.com/sites/com/files/styles/image_landscape_hero/public/muzooka/Childish%2BGambino/Childish%2520Gambino_16_9_1581371417.jpg?itok=_AuG73_8")),
                             SampleCardModel(title: "NAV", description: "#music", imageURL: URL(string: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2019%2F09%2Fnav-streetsnaps-street-style-interview-london-02.jpg?q=75&w=800&cbr=1&fit=max")),
                             SampleCardModel(title: "Kygo", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/43/Kygo_%2828481718120%29_%282%29_%28cropped%29.jpg")),
                             SampleCardModel(title: "KYLE", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/30/7e/ba/307ebad3cb872f8ee98034684856173b.jpg")),
                             SampleCardModel(title: "Tyga", description: "#music", imageURL: URL(string: "https://i.dailymail.co.uk/1s/2019/10/23/00/20061168-7602675-image-a-14_1571787507845.jpg")),
                             SampleCardModel(title: "Lil Pump", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/1f/80/2f/1f802f0d87650bd5ea7ce9df26537fb1.jpg")),
                             SampleCardModel(title: "Jonas Brothers", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/11/5a/4e/115a4e6e26a4e071e46d423df8f146ff.jpg")),
                             SampleCardModel(title: "Playboi Carti", description: "#music", imageURL: URL(string: "https://www.musicinsf.com/wp-content/uploads/2018/07/V9A9632.jpg")),
                             SampleCardModel(title: "Chance the Rapper", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/bd/1e/1b/bd1e1b115ae1a85e1ef10bbde25061f9.jpg")),
                             SampleCardModel(title: "blackbear", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/24/ae/0a/24ae0afec457e65e0c75bcf02d3f4f8e.png")),
                             SampleCardModel(title: "BlocBoy JB", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/4a/59/ba/4a59ba5d930fa8e1ca68dd974b004ac4.jpg")),
                             SampleCardModel(title: "5 Seconds of Summer", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/2e/18/bc/2e18bc22aa6e26e3d03d8ac96c4a3ca4.jpg")),
                             SampleCardModel(title: "Tyler, The Creator", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/69/87/d8/6987d8565d14c1696a99ec611058d434.jpg")),
                             SampleCardModel(title: "Famous Dex", description: "#music", imageURL: URL(string: "https://lastfm.freetls.fastly.net/i/u/770x0/8e359a72316d8aca453ba29a95a32ca8.jpg")),
                             SampleCardModel(title: "Lewis Capaldi", description: "#music", imageURL: URL(string: "https://78.media.tumblr.com/6c00c3d20977146b4ff0c5f6b07ffdba/tumblr_inline_p4u7bs2nKx1s9on4d_540.jpg")),
                             SampleCardModel(title: "Hailee Steinfeld", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/35/6b/50/356b506e7ab8827798836f61d716f101.jpg")),
                             SampleCardModel(title: "Panic! At The Disco", description: "#music", imageURL: URL(string: "https://www.pollstar.com/Image/Photos/2018/10/9e62df12-8d6c-403c-a4e7-306305a44044-Phil_Clarkin-0262.jpg")),
                             SampleCardModel(title: "Sheck Wes", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/DcijxQzWAAA_TTN.jpg:large")),
                             SampleCardModel(title: "Metro Boomin", description: "#music", imageURL: URL(string: "https://i.redd.it/pfobo9zitjk21.jpg")),
                             SampleCardModel(title: "NLE Choppa", description: "#music", imageURL: URL(string: "https://bloximages.newyork1.vip.townnews.com/yakimaherald.com/content/tncms/assets/v3/editorial/1/00/100ffb9e-aa46-5200-9e9f-342552273632/5dd5ae8484acd.image.jpg?resize=1200%2C1388")),
                             SampleCardModel(title: "2 Chainz", description: "#music", imageURL: URL(string: "https://iscale.iheart.com/catalog/artist/675872")),
                             SampleCardModel(title: "ZAYN", description: "#music", imageURL: URL(string: "https://s2.r29static.com/bin/entry/832/x,80/2157318/image.jpg")),
                             SampleCardModel(title: "Russ", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/4b/fe/64/4bfe64af3c2b3b95eb175a7829ccb814.jpg")),
                             SampleCardModel(title: "NF", description: "#music", imageURL: URL(string: "https://www.pollstar.com/Image/Photos/2018/01/289087bf-97c3-4abf-a23d-9476e4c5aee0-bobigshownf.jpg")),
                             SampleCardModel(title: "Demi Lovato", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/01/ef/e8/01efe82a54f7564ceb6a8f6504cdc4a2.jpg")),
                             SampleCardModel(title: "Martin Garrix", description: "#music", imageURL: URL(string: "https://weraveyou.com/wp-content/uploads/2016/09/14280608_1321424694541808_1801048201_n.jpg")),
                             SampleCardModel(title: "J Balvin", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/98/23/ca/9823ca75663ec13576e7f7a1dd9f0cd1.jpg")),
                             SampleCardModel(title: "Sam Hunt", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2020/03/22/arts/22hunt5/22hunt5-articleLarge.jpg?quality=85&auto=webp&disable=upscale")),
                             SampleCardModel(title: "SZA", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/b6/af/c3/b6afc364075d8af0e066186fe087a91b.png")),
                             SampleCardModel(title: "James Arthur", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/0c/1b/bf/0c1bbf78240f7357859b756e0ed3023a.jpg")),
                             SampleCardModel(title: "YG", description: "#music", imageURL: URL(string: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2018%2F10%2F4hunnid-late-to-school-lookbook-playboi-carti-006.jpg?q=75&w=800&cbr=1&fit=max")),
                             SampleCardModel(title: "YoungBoy Never Broke Again", description: "#music", imageURL: URL(string: "https://incorporatedstyle.com/content/uploads/youngboy-nba-instagram-3-5-19-incorporated-style-cover.jpg")),
                             SampleCardModel(title: "Charlie Puth", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2018/05/27/arts/27PUTH1/27PUTH1-superJumbo.jpg")),
                             SampleCardModel(title: "Ski Mask The Slump God", description: "#music", imageURL: URL(string: "https://pm1.narvii.com/6465/87c3d452858398baf9724be368bff5c653a35fa2_hq.jpg")),
                             SampleCardModel(title: "Joji", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/95/4e/cc/954ecc5c6dfb0f08014df9faf0436335.jpg")),
                             SampleCardModel(title: "Bryson Tiller", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/a2/2a/01/a22a010a75126f6f02858596365226f2.jpg")),
                             SampleCardModel(title: "Polo G", description: "#music", imageURL: URL(string: "https://memberdata.s3.amazonaws.com/hi/hitsdd/photos/hitsdd_photo_gal__photo_2069068611.jpg")),
                             SampleCardModel(title: "DJ Snake", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/D22d1HzXQAIohkx.jpg")),
                             SampleCardModel(title: "Flipp Dinero", description: "#music", imageURL: URL(string: "https://one37pm.imgix.net/one37pm-editor-dev-images/s3fs-public/user-images/2019-11/Flipp-Dinero-5234-2.jpg")),
                             SampleCardModel(title: "Mac Miller", description: "#music", imageURL: URL(string: "https://www.giantartists.com/images/pics/180814_Vulture_MacMiller_091_bw.jpg")),
                             SampleCardModel(title: "Arizona Zervas", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/DFn8ToRUAAUTTCa.jpg")),
                             SampleCardModel(title: "BTS", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/d1/66/f4/d166f420bfc3da03a359087a97768cc0.jpg")),
                             SampleCardModel(title: "Thomas Rhett", description: "#music", imageURL: URL(string: "https://4.bp.blogspot.com/-DQadvQJbmlU/T_b5BwkIu9I/AAAAAAAAB2w/5qvOvKQumjQ/s1600/TR_PHOTO_(Key)_MG_8525+MAIN.jpg")),
                             SampleCardModel(title: "Julia Michaels", description: "#music", imageURL: URL(string: "https://www.theplace2.ru/cache/archive/julia_michaels/img/2017_jack_brindgland_vevo_lift_(10)-gthumb-gwdata1200-ghdata1200-gfitdatamax.jpg")),
                             SampleCardModel(title: "Ellie Goulding", description: "#music", imageURL: URL(string: "https://www.hawtcelebs.com/wp-content/uploads/2016/06/ellie-goulding-by-nino-munoz-photoshoot_2.jpg")),
                             SampleCardModel(title: "Clean Bandit", description: "#music", imageURL: URL(string: "https://vignette.wikia.nocookie.net/annemarieiam/images/3/36/Clean_Bandit.png/revision/latest?cb=20180806145421")),
                             SampleCardModel(title: "Kane Brown", description: "#music", imageURL: URL(string: "https://wallpapersmug.com/download/750x1334/a8ce35/celebrity-singer-kane-brown.jpg")),
                             SampleCardModel(title: "Aminé", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/72/d7/40/72d7402e089e52807d52d9974bdb026c.jpg")),
                             SampleCardModel(title: "A$AP Ferg", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/54836859e4b05657e7b49f80/1569121901686-OGAREKA914M1NFD1KNTD/ke17ZwdGBToddI8pDm48kEE2HPKvbn8onGarKqvOYaJ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UXjI5F5hyY69Rh34wz6Nqp9cAiO_t_aIrgXTcQvOFx1Ya9nzg0O0_sCfDyH3Q6rDGQ/A%EF%BF%BDAP_FERG-1.jpg?format=500w")),
                             SampleCardModel(title: "Tones And I", description: "#music", imageURL: URL(string: "https://www.readdork.com/images/article/Artist-Images/T/Tones%20And%20I/_crop1500x1000/tones-and-i-apr20.jpg")),
                             SampleCardModel(title: "A$AP Rocky", description: "#music", imageURL: URL(string: "https://66.media.tumblr.com/a40d81a79a93f9e513f001b140d00c5b/tumblr_poqy9hIGLd1s2dlreo1_1280.jpg")),
                             SampleCardModel(title: "Nicki Minaj", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/e6/86/96/e686969e7ab6f0c9d95f0de1c12422e0.jpg")),
                             SampleCardModel(title: "Doja Cat", description: "#music", imageURL: URL(string: "https://images.thefacecdn.com/images/ED002_MASTERSOCIAL_DOJACAT_1.jpg?fit=crop&crop=focalpoint&fp-x=0.3548&fp-y=0.4555&w=1180")),
                             SampleCardModel(title: "Liam Payne", description: "#music", imageURL: URL(string: "https://www.thefashionisto.com/wp-content/uploads/2019/12/Liam-Payne-2019-Tetu-Magazine-Photo-Shoot-006.jpg")),
                             SampleCardModel(title: "YBN Nahmir", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/46/94/91/469491708c8e1a1d6aa05690495e3ca7.jpg")),
                             SampleCardModel(title: "Niall Horan", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/3c/7c/21/3c7c210d00fb210186aa07eeabf8b5f8.jpg")),
                             SampleCardModel(title: "Quality Control", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2017/11/26/arts/26QUALITY1/26QUALITY1-superJumbo.jpg")),
                             SampleCardModel(title: "Calboy", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/1f/e4/eb/1fe4ebaaf2f60bb46452c702994e2c2f.jpg")),
                             SampleCardModel(title: "Machine Gun Kelly", description: "#music", imageURL: URL(string: "https://cdn.shopify.com/s/files/1/1878/3879/products/N3670.jpg?v=1551271114")),
                             SampleCardModel(title: "Blueface", description: "#music", imageURL: URL(string: "https://ca-times.brightspotcdn.com/dims4/default/4a385ab/2147483647/strip/true/crop/2800x2531+0+0/resize/1486x1343!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F5c%2Fdc%2Fb5e37e3749c59fee703fe764a89b%2F3083367-et-0621-blueface-6c-gmf.JPG")),
                             SampleCardModel(title: "Lil Peep", description: "#music", imageURL: URL(string: "https://www.mariotestino.com/wp-content/uploads/2017/09/00030_170205_017_MT_v3-1-1072x1400.jpg")),
                             SampleCardModel(title: "Tee Grizzley", description: "#music", imageURL: URL(string: "https://s3.amazonaws.com/stockx-sneaker-analysis/wp-content/uploads/2019/06/80640004.jpg")),
                             SampleCardModel(title: "6LACK", description: "#music", imageURL: URL(string: "https://lastfm.freetls.fastly.net/i/u/ar0/805bdacb125483ba9da90972b6ad01aa.jpg")),
                             SampleCardModel(title: "H.E.R.", description: "#music", imageURL: URL(string: "https://www.citynews1130.com/wp-content/blogs.dir/sites/9/2018/11/07/NYET303-117_2018_201718_hd.jpg")),
                             SampleCardModel(title: "Jay Rock", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/5a17cae9f9a61edc99d6e79f/1548329549866-IPX7CR1HEPR19HIQM386/ke17ZwdGBToddI8pDm48kEsloQSdTeqlYevNz3NCbl17gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0hx0TKp4jCW7sB_BGURRbuWBQdLiSRgTSPVQN3C2ocbPT9mi99zz1Rhsrcv1q-Dh1A/jay+rock.jpg")),
                             SampleCardModel(title: "Dean Lewis", description: "#music", imageURL: URL(string: "https://cdn.newsapi.com.au/image/v1/82b7398464324f040a9b57f2dfbca261")),
                             SampleCardModel(title: "Megan Thee Stallion", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2020/03/15/magazine/15mag-megantheestallion-03/15mag-megantheestallion-03-verticalTwoByThree735-v3.jpg")),
                             SampleCardModel(title: "Lil Xan", description: "#music", imageURL: URL(string: "https://metro.co.uk/wp-content/uploads/2018/09/sei_25785873-4588-e1537961522125.jpg?quality=90&strip=all")),
                             SampleCardModel(title: "Ella Mai", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/75/dd/f2/75ddf2948dd8529cd7aeeac54521e7cf.jpg")),
                             SampleCardModel(title: "Avicii", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/avicii-final-days-826e4c7e-ef8a-4ac2-9763-a0e9d5f6d613.jpg")),
                             SampleCardModel(title: "Tory Lanez", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/e/e3/Tory_Lanez_2500x1669.jpg")),
                             SampleCardModel(title: "Y2K", description: "#music", imageURL: URL(string: "https://www.c-heads.com/wp-content/uploads/2017/09/IMG_1280-Kopie.jpg")),
                             SampleCardModel(title: "DRAM", description: "#music", imageURL: URL(string: "https://media.pitchfork.com/photos/5d4af4b1cd61a4000929c9e8/2:1/w_2634,h_1317,c_limit/DRAM.jpg")),
                             SampleCardModel(title: "Trevor Daniel", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2020/03/TD1.jpg?resize=1800,1200&w=1800")),
                             SampleCardModel(title: "Portugal. The Man", description: "#music", imageURL: URL(string: "https://www.portugaltheman.com/sites/g/files/g2000000591/f/201908/Bg_FaceLift.jpg?itok=BRMuiV5a")),
                             SampleCardModel(title: "Ali Gatie", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/DivSjI3WAAAMzS3.jpg")),
                             SampleCardModel(title: "Lil Yachty", description: "#music", imageURL: URL(string: "https://wallpaperaccess.com/full/198619.jpg")),
                             SampleCardModel(title: "David Guetta", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/33/David_Guetta_2013-04-12_001.jpg")),
                             SampleCardModel(title: "Yo Gotti", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/7c/Yo_Gotti_2013.jpg")),
                             SampleCardModel(title: "PnB Rock", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/58d985e4b3db2bf10b5b11ce/1521670612182-7HMCUJ428DLN2O0T5A24/ke17ZwdGBToddI8pDm48kMXRibDYMhUiookWqwUxEZ97gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0luUmcNM2NMBIHLdYyXL-Jww_XBra4mrrAHD6FMA3bNKOBm5vyMDUBjVQdcIrt03OQ/IMG_5770.jpg?format=1500w")),
                             SampleCardModel(title: "Lil Tjay", description: "#music", imageURL: URL(string: "https://cuindependent.com/new/wp-content/uploads/2019/12/49128850676_8b77b94327_o-scaled.jpeg")),
                             SampleCardModel(title: "Miguel", description: "#music", imageURL: URL(string: "https://www.thefashionisto.com/wp-content/uploads/2015/10/Miguel-2015-Photo-Shoot-Guardian-007.jpg")),
                             SampleCardModel(title: "Lil Dicky", description: "#music", imageURL: URL(string: "https://www.wmagazine.com/wp-content/uploads/2016/07/18/578d3cd257a63ce6129955e7_062916_W_LilDicky_0325crop.jpg?crop=3px,524px,3567px,2675px&w=1536px")),
                             SampleCardModel(title: "Alessia Cara", description: "#music", imageURL: URL(string: "https://dancingastronaut.com/wp-content/uploads/2018/08/Alessia-Cara-suicide-prevention-1.jpg")),
                             SampleCardModel(title: "Michael Bublé", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/f2/ae/e2/f2aee2ddd902d397fbcbe0b3dcaa4bf8.jpg")),
                             SampleCardModel(title: "Ava Max", description: "#music", imageURL: URL(string: "https://celebmafia.com/wp-content/uploads/2019/08/ava-max-euphoria.-magazine-photoshoot-2019-5.jpg")),
                             SampleCardModel(title: "Jason Derulo", description: "#music", imageURL: URL(string: "https://thenypost.files.wordpress.com/2019/11/jd4.jpg?quality=80&strip=all&w=1024")),
                             SampleCardModel(title: "Morgan Wallen", description: "#music", imageURL: URL(string: "https://www.shakyboots.com/wp-www-shakyboots-com/wp/wp-content/uploads/2019/12/morgan-wallen-5f0c8fee.jpg")),
                             SampleCardModel(title: "Major Lazer", description: "#music", imageURL: URL(string: "https://musiklemon.com/admin/upload/57fccd9ad8961.png")),
                             SampleCardModel(title: "ScHoolboy Q", description: "#music", imageURL: URL(string: "https://m.media-amazon.com/images/M/MV5BYjViZmIzMGItMjA0My00MDUyLTk2MjctZDJkMzMzNmJkODVlXkEyXkFqcGdeQXVyNTI5NjIyMw@@._V1_.jpg")),
                             SampleCardModel(title: "Dreamville", description: "#music", imageURL: URL(string: "https://lh3.googleusercontent.com/proxy/RY_kNeGsDFtfcUI3ZeOyL-pZkbpkxJdQuNBM921ST6K9zgqBRPHhf8w48fvoPxY89jOk_fr2qvPBsffP9qIdqNnZDsXjf2UPaVI78hkcS2VtXSjPGW-7LaWtro-n3vno8Ir-Fez--8kif6MaQFIp8zWtxQ")),
                             SampleCardModel(title: "Nio Garcia", description: "#music", imageURL: URL(string: "https://bonchevip.com/wp-content/uploads/2019/11/Hoy-Se-Bebe-de-Nio-Garcia-1-en-Republica-Dominicana.jpg")),
                             SampleCardModel(title: "Diplo", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/6/62/Diplo_2014_Press_Photo_%28cropped%29.jpg")),
                             SampleCardModel(title: "Macklemore", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/6/63/Macklemore_The_Heist_Tour_1_cropped.jpg")),
                             SampleCardModel(title: "Quavo", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/58ebb09d96a2450e5542a889/master/w_2096,h_3000,c_limit/Migos-0517-GQ-FAMI06-01.jpg")),
                             SampleCardModel(title: "Lorde", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/7d/77/24/7d7724330b2fa4e2506be320704c3a21.jpg")),
                             SampleCardModel(title: "Don Toliver", description: "#music", imageURL: URL(string: "https://img.texasmonthly.com/2020/03/don-toliver-houston.jpg?auto=compress&crop=faces&fit=crop&fm=jpg&h=1400&ixlib=php-1.2.1&q=45&w=1400")),
                             SampleCardModel(title: "Kesha", description: "#music", imageURL: URL(string: "https://external-preview.redd.it/A4R4r72kAuFvrNrW6LEtJ-xsI3wVXr2LdunKM-5Bo_8.jpg?auto=webp&s=0f1870ca40580935e0c34f5b317cbb6e632fb76d")),
                             SampleCardModel(title: "Noah Cyrus", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/a2/3f/86/a23f86670e1637e66ebc5da2ee989c72.jpg")),
                             SampleCardModel(title: "AJR", description: "#music", imageURL: URL(string: "https://media.americansongwriter.com/wp-content/uploads/2020/04/07080227/AJR.jpg")),
                             SampleCardModel(title: "Tiësto", description: "#music", imageURL: URL(string: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/06/12/12/screen-shot-2018-06-12-at-12.48.25.png?w968h681")),
                             SampleCardModel(title: "JACKBOYS", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/b6/dc/b4/b6dcb423231c760a5214e8da080818cf.jpg")),
                             SampleCardModel(title: "24kGoldn", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/06/24kgoldnrlla.jpg")),
                             SampleCardModel(title: "Cheat Codes", description: "#music", imageURL: URL(string: "https://www.thesun.co.uk/wp-content/uploads/2017/11/2-6-17-cheatcodes11809-copy-web-1.jpg")),
                             SampleCardModel(title: "City Girls", description: "#music", imageURL: URL(string: "https://cultureposters.com/wp-content/uploads/2019/03/city-girls.jpg")),
                             SampleCardModel(title: "Huncho Jack", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/00/8f/37/008f3745f169ecfd5a686741f93fd0b9.jpg")),
                             SampleCardModel(title: "Anuel AA", description: "#music", imageURL: URL(string: "https://bucket.mn2s.com/wp-content/uploads/2018/10/13144919/03-Anuel-AA-p-billboard-1548.jpg")),
                             SampleCardModel(title: "Gunna", description: "#music", imageURL: URL(string: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fjosephdeacetis%2Ffiles%2F2018%2F12%2Fimage1-2.jpg")),
                             SampleCardModel(title: "Ozuna", description: "#music", imageURL: URL(string: "https://static.billboard.com/files/media/02-ozuna-2019-cr-Juan-Albizu-billboard-1548-1024x677.jpg")),
                             SampleCardModel(title: "Ayo & Teo", description: "#music", imageURL: URL(string: "https://wallpaperaccess.com/full/291291.jpg")),
                             SampleCardModel(title: "Old Dominion", description: "#music", imageURL: URL(string: "https://express-images.franklymedia.com/6616/sites/392/2020/02/12112334/GettyImages-522362150.jpg")),
                             SampleCardModel(title: "Tame Impala", description: "#music", imageURL: URL(string: "https://mediad.publicbroadcasting.net/p/shared/npr/styles/x_large/nprshared/202003/805197792.jpg")),
                             SampleCardModel(title: "Daddy Yankee", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/86/21/8f/86218f8b5033a8f60ef235ae9c8ade36.jpg")),
                             SampleCardModel(title: "Nicky Jam", description: "#music", imageURL: URL(string: "https://i2.wp.com/coogradio.com/wp-content/uploads/2018/10/fdc8299bdaaaa31b-20170526__NICKY_JAM_Shot2_0146_V1G.jpg?fit=1024%2C1536")),
                             SampleCardModel(title: "Jonas Blue", description: "#music", imageURL: URL(string: "https://edm.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTY2MDgxMDE4Nzc0NjkzNTE4/jonas-blue.jpg")),
                             SampleCardModel(title: "Wiz Khalifa", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/EB8eNtUUcAEId_R.jpg")),
                             SampleCardModel(title: "BROCKHAMPTON", description: "#music", imageURL: URL(string: "https://66.media.tumblr.com/36d8601d04fabc0f26a5fa29243f6a37/tumblr_p4z9qnBFWK1qc1ct4o3_1280.jpg")),
                             SampleCardModel(title: "KIDS SEE GHOSTS", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/gettyimages-509641178-4238df07-a552-4984-9c50-6d9972379d5e.jpg?resize=1800,1200&w=1800")),
                             SampleCardModel(title: "Kehlani", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/60/83/4e/60834e251890433e43859b714cab9584.jpg")),
                             SampleCardModel(title: "Wham!", description: "#music", imageURL: URL(string: "https://wallpapercave.com/wp/wp4296988.jpg")),
                             SampleCardModel(title: "Tay-K", description: "#music", imageURL: URL(string: "https://wallpapercave.com/wp/wp2530870.jpg")),
                             SampleCardModel(title: "Rob $tone", description: "#music", imageURL: URL(string: "https://townsquare.media/site/812/files/2017/01/rob-stone.jpg?w=980&q=75")),
                             SampleCardModel(title: "Brett Young", description: "#music", imageURL: URL(string: "https://www.570news.com/wp-content/blogs.dir/sites/3/2018/09/14/NYET507-88_2018_191525_hd.jpg")),
                             SampleCardModel(title: "Zara Larsson", description: "#music", imageURL: URL(string: "https://cdn2.thelineofbestfit.com/images/made/images/remote/https_cdn2.thelineofbestfit.com/media/2014/zara-larsson-2019_1290_1201.jpg")),
                             SampleCardModel(title: "Summer Walker", description: "#music", imageURL: URL(string: "https://static.billboard.com/files/media/02-Summer-Walker-press-by-Aiden-Cullen-2019-billboard-1548-compressed.jpg")),
                             SampleCardModel(title: "Starley", description: "#music", imageURL: URL(string: "https://images.ctfassets.net/5615tdzw3m8i/6LFMUxsAZvDP36lNuqo7rh/34d26919ea164281e819ece1fa3159fb/starley-wide-3wx.jpg")),
                             SampleCardModel(title: "Bryce Vine", description: "#music", imageURL: URL(string: "https://radio.rutgers.edu/wp-content/uploads/2018/11/photo-credit-juco-extralarge_1518724641538-1.jpg")),
                             SampleCardModel(title: "Loud Luxury", description: "#music", imageURL: URL(string: "https://edmidentity.com/wp-content/uploads/2020/03/IMG_1896.jpg")),
                             SampleCardModel(title: "Dennis Lloyd", description: "#music", imageURL: URL(string: "https://static.timesofisrael.com/www/uploads/2019/12/AP_19105118547025-e1576876836707.jpg")),
                             SampleCardModel(title: "PARTYNEXTDOOR", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/87/PartyNextDoor_2016_press_photo.png")),
                             SampleCardModel(title: "Desiigner", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/561468bae4b0b2fafb9e14f5/1512514271324-LV3NCT31G8QPGQAUW9BQ/ke17ZwdGBToddI8pDm48kFWxnDtCdRm2WA9rXcwtIYR7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UcTSrQkGwCGRqSxozz07hWZrYGYYH8sg4qn8Lpf9k1pYMHPsat2_S1jaQY3SwdyaXg/Desiigner-Highsnobiety-Hyperlinked-Look-2-04.jpg?format=1000w")),
                             SampleCardModel(title: "Smokepurpp", description: "#music", imageURL: URL(string: "https://audibletreats.com/wp-content/uploads/2018/12/smokepurpp-from-instagram.jpg")),
                             SampleCardModel(title: "Jon Pardi", description: "#music", imageURL: URL(string: "https://d38trduahtodj3.cloudfront.net/images.ashx?t=ig&rid=GreeleyStampede&i=JP_93A0959_HIres_WEB(4).jpg")),
                             SampleCardModel(title: "GoldLink", description: "#music", imageURL: URL(string: "https://cdn.vor.us/event/358526/og/da8f2e234186415596d5e7fcff9cb2b4.image!jpeg.318126.jpg.goldlink.jpg")),
                             SampleCardModel(title: "MadeinTYO", description: "#music", imageURL: URL(string: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2019%2F10%2Fmadeintyo-dj-jehmahk-streetsnaps-style-interview-3-1.jpg?q=75&w=800&cbr=1&fit=max")),
                             SampleCardModel(title: "Jon Bellion", description: "#music", imageURL: URL(string: "https://artist-assets.hubbardradio.com/jonbellion-1_v1000.jpg")),
                             SampleCardModel(title: "YK Osiris", description: "#music", imageURL: URL(string: "https://lastfm.freetls.fastly.net/i/u/ar0/1dd173286c2915f7801c67068da98e89.jpg")),
                             SampleCardModel(title: "Jack Harlow", description: "#music", imageURL: URL(string: "https://www.forecastlefest.com/wp-www-forecastlefest-com/wp/wp-content/uploads/2020/02/jack-harlow-9d9d0594.jpg")),
                             SampleCardModel(title: "Sia", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/13/2d/4d/132d4d27cbfe54611a4667643fbd2a1c.jpg")),
                             SampleCardModel(title: "Maluma", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/5ddc296df9da7100098924ea/master/w_2500,h_3333,c_limit/maluma-gq-men-of-the-year-2019-12.jpg")),
                             SampleCardModel(title: "Dean Martin", description: "#music", imageURL: URL(string: "https://specials-images.forbesimg.com/imageserve/526877172/960x0.jpg?fit=scale")),
                             SampleCardModel(title: "Alec Benjamin", description: "#music", imageURL: URL(string: "https://api.time.com/wp-content/uploads/2019/06/alec-benjamin.jpg")),
                             SampleCardModel(title: "Saweetie", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/56c346b607eaa09d9189a870/1550520403544-FO1N6H9PYO2XD6A998VO/ke17ZwdGBToddI8pDm48kNQ0Dds4OaVwXKz4lIliiXZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0rQeu_A0VlcGJEiWdfSJ_zX7AkVwxbMIAYVxku088aqE12hBAAPy02Op6r73ckLiPQ/FLAUNT-MAGAZINE-SAWEETIE-4.jpg")),
                             SampleCardModel(title: "KAROL G", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/f9/9a/b2/f99ab2b38de253a561ab474ffa83277c.jpg")),
                             SampleCardModel(title: "Rita Ora", description: "#music", imageURL: URL(string: "https://celebmafia.com/wp-content/uploads/2017/10/rita-ora-photoshoot-for-absolut-vodka-2017-2.jpg")),
                             SampleCardModel(title: "Fifth Harmony", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/45/b5/ea/45b5eab127c7a928637c7e8a5a53f194.jpg")),
                             SampleCardModel(title: "Nipsey Hussle", description: "#music", imageURL: URL(string: "https://www.usmagazine.com/wp-content/uploads/2019/09/Nipsey-Hussle-Puma-5.jpg")),
                             SampleCardModel(title: "JP Saxe", description: "#music", imageURL: URL(string: "https://static1.squarespace.com/static/58f7b83a46c3c4be2ebeaa00/t/59d700f1edaed8d460ea961c/1507262710311/JP_Press.jpg?format=1500w")),
                             SampleCardModel(title: "SHAED", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/d9/Shaed_03_14_2019_-22_%2846788082374%29.jpg")),
                             SampleCardModel(title: "P!nk", description: "#music", imageURL: URL(string: "https://66.media.tumblr.com/7d5f3f0256d212ddd8fee9c95476be39/tumblr_p0rdvbmrBT1vn1fhlo1_1280.png")),
                             SampleCardModel(title: "YFN Lucci", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/f9/8a/bd/f98abd48208073511291a7ad6e63dcb8.jpg")),
                             SampleCardModel(title: "Frank Ocean", description: "#music", imageURL: URL(string: "https://dazedimg-dazedgroup.netdna-ssl.com/1600/azure/dazed-prod/1260/8/1268842.jpg")),
                             SampleCardModel(title: "Lord Huron", description: "#music", imageURL: URL(string: "https://149354818.v2.pressablecdn.com/wp-content/uploads/2018/06/8f5882ef-4197-485b-876c-673599defcfb.jpg")),
                             SampleCardModel(title: "Mabel", description: "#music", imageURL: URL(string: "https://dazedimg-dazedgroup.netdna-ssl.com/2000/azure/dazed-prod/1170/7/1177136.jpg")),
                             SampleCardModel(title: "Lunay", description: "#music", imageURL: URL(string: "https://wallpapercave.com/wp/wp4061947.jpg")),
                             SampleCardModel(title: "Mark Ronson", description: "#music", imageURL: URL(string: "https://si.wsj.net/public/resources/images/B3-DF308_MARK5__1000V_20190220195033.jpg")),
                             SampleCardModel(title: "MAX", description: "#music", imageURL: URL(string: "https://static.billboard.com/files/media/bb25-2017-hot100-MAX-cr-Courtesy-of-Crush-Music-billboard-1548-compressed.jpg")),
                             SampleCardModel(title: "Surfaces", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/5cae457151f4d4fb6d1c8a2a/1557791944925-BDFLR6V2J9UV8QTUHQI6/IMG_0596.JPG?format=1500w&content-type=image%2Fjpeg")),
                             SampleCardModel(title: "Maren Morris", description: "#music", imageURL: URL(string: "https://www.fayettevilleflyer.com/wp-content/uploads/2020/02/marenmorris.jpg")),
                             SampleCardModel(title: "TOKYO’S REVENGE", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/EO-oWZIVUAA3Laf.jpg")),
                             SampleCardModel(title: "Hugh Jackman", description: "#music", imageURL: URL(string: "https://cdn.asiatatler.com/asiatatler/i/hk/2019/05/05175107-montblanc-hugh-jackman-4_cover_1335x2000.jpg")),
                             SampleCardModel(title: "Louis Tomlinson", description: "#music", imageURL: URL(string: "https://www.thesun.co.uk/wp-content/uploads/2020/01/NINTCHDBPICT000556913256.jpg")),
                             SampleCardModel(title: "BaKeem", description: "#music", imageURL: URL(string: "https://66.media.tumblr.com/0fc124b5974ccceab6fc4d39e0d757b4/tumblr_nm8l1qmzG11qasnrqo1_1280.jpg")),
                             SampleCardModel(title: "Zac Efron", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/C5LMHZrWAAQzU3O.jpg")),
                             SampleCardModel(title: "Ant Saunders", description: "#music", imageURL: URL(string: "https://www.euphoriazine.com/wp-content/uploads/2020/01/Ant-Saunders-Press-Photo-3-Credit_-Khufu-Najee.jpg")),
                             SampleCardModel(title: "Cashmere Cat", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/DVeTfSWUQAABSrg.jpg")),
                             SampleCardModel(title: "Dustin Lynch", description: "#music", imageURL: URL(string: "https://www.soundslikenashville.com/wp-content/uploads/2020/01/Dustin-Lynch-cover-1580142276.jpg")),
                             SampleCardModel(title: "N.E.R.D", description: "#music", imageURL: URL(string: "https://www.nme.com/wp-content/uploads/2016/09/11NERD01PMVH061113-696x464.jpg")),
                             SampleCardModel(title: "Jhay Cortez", description: "#music", imageURL: URL(string: "https://i.pinimg.com/736x/f4/fc/71/f4fc71c01480d18d144c52085ad615e7.jpg")),
                             SampleCardModel(title: "Idina Menzel", description: "#music", imageURL: URL(string: "https://www.geffenplayhouse.org/site/assets/files/21220/idinamenzel-1000x1400.jpg")),
                             SampleCardModel(title: "Maggie Lindemann", description: "#music", imageURL: URL(string: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fhughmcintyre%2Ffiles%2F2017%2F03%2FMAGGIE-L-300-RECORDS_-6-1200x958.jpg")),
                             SampleCardModel(title: "Steve Aoki", description: "#music", imageURL: URL(string: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/02/09/12/steve-denim-2-clean-preview.jpeg")),
                             SampleCardModel(title: "Joyner Lucas", description: "#music", imageURL: URL(string: "https://www.washingtonpost.com/resizer/Syfg6JqvIiEQ5ZfeqfnCzS0PIXs=/1440x0/smart/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/EQJ6Y2DI2AI6RP4M7HWS4ZZK34.jpg")),
                             SampleCardModel(title: "Blanco Brown", description: "#music", imageURL: URL(string: "https://www.blancobrown.com/app/uploads/2019/06/KAV_7931.jpg")),
                             SampleCardModel(title: "Conan Gray", description: "#music", imageURL: URL(string: "https://assets.rebelmouse.io/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZSI6Imh0dHBzOi8vYXNzZXRzLnJibC5tcy8xOTM0Nzc2MC9vcmlnaW4uanBnIiwiZXhwaXJlc19hdCI6MTYwODUzODg1NX0.xRyEFuqcJEjdJ-JTLVWndAOHJMuD2KfoISOVRbVZu6I/img.jpg?width=980")),
                             SampleCardModel(title: "Rudimental", description: "#music", imageURL: URL(string: "https://s3.amazonaws.com/files.madeinkatana.com/warners/uploads/5b0bac9793881.jpg")),
                             SampleCardModel(title: "Keala Settle", description: "#music", imageURL: URL(string: "https://s3.amazonaws.com/sfc-datebook-wordpress/wp-content/uploads/sites/2/2020/02/MER74cd021694d45bc0ca9e2f97f1cad_popquiz0308_settle-1024x739.jpg")),
                             SampleCardModel(title: "The Carters", description: "#music", imageURL: URL(string: "https://static.vibe.com/files/photo_gallery_images/Carters-Lourve-17.jpg")),
                             SampleCardModel(title: "Normani", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2020/02/Normani-womens-issue-cover.jpg")),
                             SampleCardModel(title: "Axwell Ingrosso", description: "#music", imageURL: URL(string: "https://i0.wp.com/thegroovecartel.com/wp-content/uploads/2016/11/Axwell-Ingrosso.jpg?fit=2048%2C1363&ssl=1")),
                             SampleCardModel(title: "Sech", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2019/09/Sech.jpg?resize=1800,1200&w=1800")),
                             SampleCardModel(title: "Ugly God", description: "#music", imageURL: URL(string: "https://miro.medium.com/max/1024/1*0bs2mReO9iIGdI0LhZxuYA.jpeg")),
                             SampleCardModel(title: "Jhené Aiko", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4a/Jhen%C3%A9_Aiko_%2828652538995%29.jpg")),
                             SampleCardModel(title: "Sam Feldt", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/6/66/SamFeldt2020_2_srgb_crop.jpg")),
                             SampleCardModel(title: "Black Eyed Peas", description: "#music", imageURL: URL(string: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_35681389-7306.jpg?quality=90&strip=all&zoom=1&resize=964%2C981&ssl=1")),
                             SampleCardModel(title: "Powfu", description: "#music", imageURL: URL(string: "https://asset.onemusic.ph/assetsonemusicph/media/articles/1586017102_powfu5.JPG")),
                             SampleCardModel(title: "Little Mix", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/58/80/0f/58800ffe1e0f56fce936547be603eec1.jpg")),
                             SampleCardModel(title: "Ty Dolla $ign", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/de/d0/c1/ded0c11726783377b47a071b223b248c.jpg")),
                             SampleCardModel(title: "Mike WiLL Made-It", description: "#music", imageURL: URL(string: "https://static.stereogum.com/uploads/2013/12/Mike_WiLL-New_01-640x960.jpg")),
                             SampleCardModel(title: "Anne-Marie", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/f/f7/Anne-Marie_Rose_Nicholson%2C_2017_%28cropped%29.jpg")),
                             SampleCardModel(title: "Wale", description: "#music", imageURL: URL(string: "https://static.billboard.com/files/media/wale-2018-cr-Maya-Darasaw-billboard-1548-compressed.jpg")),
                             SampleCardModel(title: "SOB X RBE", description: "#music", imageURL: URL(string: "https://thefader-res.cloudinary.com/private_images/w_1440,c_limit,f_auto,q_auto:best/SOBxRBE-25_asnbb1/from-left-to-right-slimmy-b-daboii-lul-g-and-yhung-t-o.jpg")),
                             SampleCardModel(title: "Nebu Kiniza", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/DGqlXrBU0AAdtvw.jpg")),
                             SampleCardModel(title: "Comethazine", description: "#music", imageURL: URL(string: "https://static1.squarespace.com/static/5b4fe8cca9e02877073116d2/5b52764a2b6a280bdea5666f/5b80526eaa4a996cc79629fc/1563126398484/IMG_2456.PNG?format=1500w")),
                             SampleCardModel(title: "Martin Jensen", description: "#music", imageURL: URL(string: "https://paramountartists.com/lib/artist/309.jpg")),
                             SampleCardModel(title: "Russell Dickerson", description: "#music", imageURL: URL(string: "https://artist-assets.hubbardradio.com/russelldickerson-6_v1000.jpg")),
                             SampleCardModel(title: "The Vamps", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/03/af/21/03af210586589a0561666b1aeb210ccf.jpg")),
                             SampleCardModel(title: "Sabrina Carpenter", description: "#music", imageURL: URL(string: "https://www.wmagazine.com/wp-content/uploads/2018/11/12/5be9abb3cf6b5f5ada67a025_lia_clay_sabrina_3.jpg?crop=341px,113px,2702px,2026px&w=1536px")),
                             SampleCardModel(title: "Pentatonix", description: "#music", imageURL: URL(string: "https://www.dailynews.com/wp-content/uploads/2019/05/LDN-L-PENTATONIX-0512-1.jpg")),
                             SampleCardModel(title: "Olivia Holt", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/56c346b607eaa09d9189a870/1534902803145-QY907TE3X55C3VQGR323/ke17ZwdGBToddI8pDm48kOl5BJyG_-Jd6FSXSq8p6eB7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0s2R59z2HWVKMNU9GXmUK4XNHiGuJB81PvQRz1ZtLttD-tmOSsVFEPJTQwo2lOtRaA/image-asset.jpeg")),
                             SampleCardModel(title: "Why Don't We", description: "#music", imageURL: URL(string: "https://www.usmagazine.com/wp-content/uploads/why-dont-we-zoom-4bde9235-8e33-4ceb-b991-5dda27483006.jpg")),
                             SampleCardModel(title: "Olivia Rodrigo", description: "#music", imageURL: URL(string: "https://www.hawtcelebs.com/wp-content/uploads/2019/11/olivia-rodrigo-at-high-school-musical-the-musical-the-series-premiere-in-burbank-11-01-2019-12.jpg")),
                             SampleCardModel(title: "Dominic Fike", description: "#music", imageURL: URL(string: "https://images.complex.com/complex/image/upload/c_crop,h_1854,w_1250,x_0,y_40/c_fill,dpr_auto,f_auto,fl_lossy,g_face,q_auto,w_1280/pfalhxc5pp64vqkbem3r.jpg")),
                             SampleCardModel(title: "Pedro Capó", description: "#music", imageURL: URL(string: "https://static1.squarespace.com/static/5b1700f4fcf7fd9db000fb5d/5b176b27562fa70b3acf162d/5cacdb26652dea15ad3907d5/1557255910201/_U4A7824+ok+hi+res.jpg?format=1500w")),
                             SampleCardModel(title: "Snakehips", description: "#music", imageURL: URL(string: "https://media3.giphy.com/avatars/zayn/Z2RW1wISQyUD.JPG")),
                             SampleCardModel(title: "Rod Wave", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2020/04/14/arts/09rodwave1/merlin_171414669_b5154907-5dfe-4f83-a073-333122e12008-superJumbo.jpg")),
                             SampleCardModel(title: "SAINt JHN", description: "#music", imageURL: URL(string: "https://www.okayplayer.com/wp-content/uploads/2018/12/img_7662-e1544221932756.jpeg")),
                             SampleCardModel(title: "Petit Biscuit", description: "#music", imageURL: URL(string: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/02/21/10/ashley-parango-petit-biscuit-press-shot-02.jpeg")),
                             SampleCardModel(title: "Marian Hill", description: "#music", imageURL: URL(string: "https://lh3.googleusercontent.com/proxy/Oskr4X0GsDuXec4pDAk4twb3wbSoDIG0OP6oPF6qRuI0Owzaf8g-CSLbcv1iMyROCTcgow3vb7l7CmugKggNWlvyXzX-EiVPqGXIhnQ7nBF0ZYLn9l7HHpkHe5UN4NSnSaEqPh1nhn15ykbffRDD3-XgKmtMlPTrJP0N1jBmmlSi")),
                             SampleCardModel(title: "Pop Smoke", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2020/02/19/multimedia/19xp-popsmoke/19xp-popsmoke-mediumSquareAt3X-v3.jpg")),
                             SampleCardModel(title: "Ambjaay", description: "#music", imageURL: URL(string: "https://everipedia-storage.s3.amazonaws.com/ProfilePicture/lang_en/ambjaay-1/mainphoto.png?nocache=811bd8f2bc")),
                             SampleCardModel(title: "Jordan Davis", description: "#music", imageURL: URL(string: "https://www.umgnashville.com/wp-content/uploads/2018/05/JordanD_124_HIres_WEB-768x768.jpg")),
                             SampleCardModel(title: "Vice", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/bb/DJ_Vice_Performing.jpg")),
                             SampleCardModel(title: "John Legend", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/0b/98/74/0b987449e48be4e16beb45352eb70321.jpg")),
                             SampleCardModel(title: "Pusha T", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/5b1dcbe987d09e2fcc4c123f/master/w_3000,h_4500,c_limit/GW20180200909_BW_FULLFRAME-PUSHA-T.jpg")),
                             SampleCardModel(title: "Wisin", description: "#music", imageURL: URL(string: "https://hauteliving.com/wp-content/uploads/2018/10/Wisin-.jpg")),
                             SampleCardModel(title: "BENEE", description: "#music", imageURL: URL(string: "https://i1.wp.com/soundofboston.com/wp-content/uploads/2019/10/BENEE-4_Credit-Nikko-LaMere.jpg?fit=2760%2C1840")),
                             SampleCardModel(title: "A$AP Mob", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/07/f4/ef/07f4efe0eeffe594867c158047e960ab.jpg")),
                             SampleCardModel(title: "Dynoro", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/7a/1c/b7/7a1cb73bc1967947667b4149c3225aec.jpg")),
                             SampleCardModel(title: "Jeremy Zucker", description: "#music", imageURL: URL(string: "https://www.grammy.com/sites/com/files/jeremy_zucker_lolla2019_photo_by_jacklyn_krol.jpg")),
                             SampleCardModel(title: "Gesaffelstein", description: "#music", imageURL: URL(string: "https://images.complex.com/complex/image/upload/c_fill,dpr_auto,f_auto,q_90,w_920/fl_lossy,pg_1/or7lltlhzpmjn53yjx0b.jpg")),
                             SampleCardModel(title: "Silk City", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/07/silk_city.jpg")),
                             SampleCardModel(title: "Young M.A", description: "#music", imageURL: URL(string: "https://media1.fdncms.com/chicago/imager/u/original/75605069/youngma_0455-web.jpg")),
                             SampleCardModel(title: "LANCO", description: "#music", imageURL: URL(string: "https://liveatthebluestone.com/wp-content/uploads/2017/12/LANCO-1.jpg")),
                             SampleCardModel(title: "Takeoff", description: "#music", imageURL: URL(string: "https://channel45news.com/wp-content/uploads/2019/05/Takeoff-GeneralImage-1-Highres.jpg")),
                             SampleCardModel(title: "Beyoncé", description: "#music", imageURL: URL(string: "https://www.thesun.co.uk/wp-content/uploads/2019/10/NINTCHDBPICT000532292543-e1571696324819.jpg")),
                             SampleCardModel(title: "BLACKPINK", description: "#music", imageURL: URL(string: "https://kprofiles.com/wp-content/uploads/2019/02/Blackpink-2018-press-cr-yg-entertainment-billboard-1548.jpg")),
                             SampleCardModel(title: "NOTD", description: "#music", imageURL: URL(string: "https://www.islandrecords.com/sites/g/files/aaj6476/f/NOTD%20PROFILE%20PIC%20square.jpg")),
                             SampleCardModel(title: "Ashe", description: "#music", imageURL: URL(string: "https://seated.imgix.net/9d187b8e-7cab-44fe-81a5-eaee4c7c4bac/IMG_8690.jpeg")),
                             SampleCardModel(title: "Flo Rida", description: "#music", imageURL: URL(string: "https://s3-eu-west-1.amazonaws.com/music-finland/_large/flo-rida-rapper-songs.png")),
                             SampleCardModel(title: "Skrillex", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/74/Skrillex_%28Sonny_Moore%29_%28cropped%29.jpg")),
                             SampleCardModel(title: "Auli'i Cravalho", description: "#music", imageURL: URL(string: "https://www.hawtcelebs.com/wp-content/uploads/2018/01/auli-i-carvalho-by-maarten-de-boer-photoshoot-in-pasadena-january-2018-4.jpg")),
                             SampleCardModel(title: "Becky G", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/D93l9naUwAA1gzF.jpg")),
                             SampleCardModel(title: "JP Cooper", description: "#music", imageURL: URL(string: "https://media.wonderlandmagazine.com/uploads/2018/03/PWP-2018-JP-Cooper-Key-Visual-2-Credit_David_Levenson.jpg")),
                             SampleCardModel(title: "Troye Sivan", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/47/Troye_Sivan_%2842022775414%29.jpg")),
                             SampleCardModel(title: "Sage The Gemini", description: "#music", imageURL: URL(string: "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F53653350%2F190808217915%2F1%2Foriginal.jpg?auto=compress&s=0c9d8eb44bf7e9cb48f525f4bd356f26")),
                             SampleCardModel(title: "Regard", description: "#music", imageURL: URL(string: "https://newmusicspace.com/wp-content/uploads/2019/12/Pa-llogo-_3_.jpg")),
                             SampleCardModel(title: "G Herbo", description: "#music", imageURL: URL(string: "https://static.highsnobiety.com/thumbor/JlytSSVYCKVo5Nv93K-mtigd7PU=/fit-in/1200x1467/smart/static.highsnobiety.com/wp-content/uploads/2019/03/06174851/passion-pain-purpose-g-herbo-creating-new-chicago-story-12.jpg")),
                             SampleCardModel(title: "Joey Bada$$", description: "#music", imageURL: URL(string: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2018%2F02%2Fjoey-badass-ev-bravado-pop-up-shop-9.jpg?q=75&w=800&cbr=1&fit=max")),
                             SampleCardModel(title: "Madison Beer", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2020/04/MadisonBeer-1.jpg?resize=1800,1200&w=1800")),
                             SampleCardModel(title: "Daniel Caesar", description: "#music", imageURL: URL(string: "https://video-images.vice.com/articles/59d4f67f8b15385af8139089/lede/1507129162759-Keavan-Yazdani.jpeg?crop=1xw%3A0.3726xh%3B0xw%2C0.326xh&resize=2000%3A*")),
                             SampleCardModel(title: "Kiiara", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Kiiara_in_2019.png")),
                             SampleCardModel(title: "Lee Brice", description: "#music", imageURL: URL(string: "https://www.musikfest.org/wp-content/uploads/sites/6/2016/12/Lee-Brice.jpg")),
                             SampleCardModel(title: "Jaden", description: "#music", imageURL: URL(string: "https://www.pe.com/wp-content/uploads/2019/04/RPE-L-CF-Jaden-0412.dk_.03-2.jpg")),
                             SampleCardModel(title: "Brett Eldredge", description: "#music", imageURL: URL(string: "https://www.warnermusicnashville.com/sites/g/files/g2000009701/files/wmn-site_brett-eldredge_2400_0.jpg")),
                             SampleCardModel(title: "Social House", description: "#music", imageURL: URL(string: "https://static1.squarespace.com/static/535eb4d7e4b08c41d0c4ae5c/535ec13de4b0586b1fc80285/5b3e8dcf03ce64ff9e20d239/1531145770308/Social-House-Interview.png?format=1500w")),
                             SampleCardModel(title: "Chris Lane", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/5a20e32e914e6bf5eede6133/1556218591507-Q66IMRA0N7TMW5N604F1/ke17ZwdGBToddI8pDm48kC9Uu--XbQGBWwE81Wwabs17gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0oycmklwMHPwSb2Cr-KYzbqosnEdh945YN0-TUZ_YufBU8h_9XBy5md4ZvYsGvliuA/ChrisLane3+%281%29.jpg")),
                             SampleCardModel(title: "gnash", description: "#music", imageURL: URL(string: "https://res-4.cloudinary.com/dostuff-media/image/upload//c_fill,g_faces,f_auto,w_800/v1540832840/event-poster-10058141.jpg")),
                             SampleCardModel(title: "Louis The Child", description: "#music", imageURL: URL(string: "https://dancingastronaut.com/wp-content/uploads/2018/08/INTERSCOPE_LTC_BTS_150-2-copy.jpg")),
                             SampleCardModel(title: "Gab Barrett", description: "#music", imageURL: URL(string: "https://pmcwwd.files.wordpress.com/2020/03/gabby-barrett-lm-001.jpg")),
                             SampleCardModel(title: "Rick Ross", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/5d4c943e745a620008640acb/master/pass/GQ-MM-RickRoss4030-02.jpg")),
                             SampleCardModel(title: "Mike Posner", description: "#music", imageURL: URL(string: "https://www.gannett-cdn.com/-mm-/4d6008320f2e395e6fe37f203b2e26699e4416be/c=0-75-4888-2836/local/-/media/2017/01/04/USATODAY/USATODAY/636191376248200218-XXX-IMG-TRUAX-MIKEPOSNER-844-3-1-7OE3IH0N-81537675.JPG")),
                             SampleCardModel(title: "Devin Dawson", description: "#music", imageURL: URL(string: "https://www.devindawsonmusic.com/sites/g/files/g2000006416/f/201702/DD_ALL-ON-ME_SINGLE-IMAGE_1200px.jpg")),
                             SampleCardModel(title: "Daya", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/8e/c3/c2/8ec3c2a5ecc400393dfd865964490c99.jpg")),
                             SampleCardModel(title: "LANY", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/30/LANY_on_July_23%2C_2015.jpg")),
                             SampleCardModel(title: "Swae Lee", description: "#music", imageURL: URL(string: "https://content.asos-media.com/-/media/hubs/swae-lee/swaeleemoment01870x1110jpg1.jpg")),
                             SampleCardModel(title: "CNCO", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2019/10/cnco.jpg")),
                             SampleCardModel(title: "A R I Z O N A", description: "#music", imageURL: URL(string: "https://cdn.baeblemusic.com/images/bblog/10-12-2017/arizonaone.jpg")),
                             SampleCardModel(title: "Robin Schulz", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/f/f9/Robin_Schulz_%28Veld_2017%29.jpg")),
                             SampleCardModel(title: "ROSALÍA", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2019/10/13/magazine/13-mag-Rosalia-picx-04/13-mag-Rosalia-picx-04-superJumbo.jpg")),
                             SampleCardModel(title: "Gryffin", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/1f/Griffyn_%2843228990201%29.jpg")),
                             SampleCardModel(title: "Aaron Carter", description: "#music", imageURL: URL(string: "https://www.refinery29.com/images/8820989.jpg")),
                             SampleCardModel(title: "Flume", description: "#music", imageURL: URL(string: "https://edm.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTU0ODkyNDk1Mjg3NzU2Mjk1/flume.jpg")),
                             SampleCardModel(title: "San Holo", description: "#music", imageURL: URL(string: "https://www.discotech.me/wp-content/uploads/2020/04/san-holo.jpg")),
                             SampleCardModel(title: "Alan Walker", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/2f/0b/3d/2f0b3d610f3063f614c615eda2c13e18.jpg")),
                             SampleCardModel(title: "Stanaj", description: "#music", imageURL: URL(string: "https://cache.umusic.com/_sites/_halo/stanaj2/images/OG2.jpg")),
                             SampleCardModel(title: "MØ", description: "#music", imageURL: URL(string: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/moe-fryd-frydendahl-2-1509026423.jpg")),
                             SampleCardModel(title: "Loren Allred", description: "#music", imageURL: URL(string: "https://cdn.vox-cdn.com/thumbor/vGKRry0e0vehRota33SNb-hrTIs=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/18746418/54d2ba3938.jpg")),
                             SampleCardModel(title: "ILLENIUM", description: "#music", imageURL: URL(string: "https://edmidentity.com/wp-content/uploads/2019/06/ILLENIUM_PRESS-6v2_3000PX_Photo-Credit-Alexandra-Gavillet.jpg")),
                             SampleCardModel(title: "Hozier", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/15/Hozier_2015_01_%28cropped%29.jpg")),
                             SampleCardModel(title: "FLETCHER", description: "#music", imageURL: URL(string: "https://mtv.mtvnimages.com/uri/mgid:ao:image:mtv.com:672613?quality=0.8&format=jpg")),
                             SampleCardModel(title: "Billy Currington", description: "#music", imageURL: URL(string: "https://static.billboard.com/files/media/billy-currington-cr-Joseph-Llanes-billboard-1548-1024x677.jpg")),
                             SampleCardModel(title: "Stunna 4 Vegas", description: "#music", imageURL: URL(string: "https://live.staticflickr.com/65535/48366911972_c1cf93ca7c_k.jpg")),
                             SampleCardModel(title: "DVBBS", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b7/DVBBS_2016.jpg")),
                             SampleCardModel(title: "Melanie Martinez", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/c3/15/20/c31520f0201fb702c00a9da786d9ef41.jpg")),
                             SampleCardModel(title: "Jax Jones", description: "#music", imageURL: URL(string: "https://d3vhc53cl8e8km.cloudfront.net/hello-staging/wp-content/uploads/2018/06/08190529/interview_jaxjones_900.jpg")),
                             SampleCardModel(title: "Hearts & Colors", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/Dtf8mEvXoAAAnnI.jpg")),
                             SampleCardModel(title: "Moon Taxi", description: "#music", imageURL: URL(string: "https://www.louisville.com/sites/default/files/article_image/JJM_1123.jpg")),
                             SampleCardModel(title: "iann dior", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/EDA4khSU4AAfH9q.jpg")),
                             SampleCardModel(title: "Shordie Shordie", description: "#music", imageURL: URL(string: "https://thefader-res.cloudinary.com/private_images/w_1440,c_limit,f_auto,q_auto:best/shordie-1-24_p7bjjw/shordie-shordie-bitchuary-interview.jpg")),
                             SampleCardModel(title: "Vince Staples", description: "#music", imageURL: URL(string: "https://www.clashmusic.com/sites/default/files/field/image/113_%20SingleImage71.jpg")),
                             SampleCardModel(title: "Kina", description: "#music", imageURL: URL(string: "https://i2.sndcdn.com/avatars-XOvCTX20RGx5BWni-yzqCgg-t500x500.jpg")),
                             SampleCardModel(title: "YUNGBLUD", description: "#music", imageURL: URL(string: "https://www.sfexaminer.com/wp-content/uploads/2019/01/AYungbludW.jpg")),
                             SampleCardModel(title: "Alesso", description: "#music", imageURL: URL(string: "https://www.gannett-cdn.com/-mm-/66a16808b17cd643aad40d210ffd8e0cf1de8faf/c=0-168-1494-2160/local/-/media/USATODAY/USATODAY/2014/11/17/635518481044370009-alesso-presspic-web.png")),
                             SampleCardModel(title: "Big Shaq", description: "#music", imageURL: URL(string: "https://www.newsbreak.ng/wp-content/uploads/2018/05/bigshaq.jpg")),
                             SampleCardModel(title: "Daryl Hall & John Oates", description: "#music", imageURL: URL(string: "https://soundwavestv.com/wp-content/uploads/2019/06/HO.jpg")),
                             SampleCardModel(title: "Luke Christopher", description: "#music", imageURL: URL(string: "https://www.hypefresh.co/wp-content/uploads/2016/08/Luke-Christopher-Is-Sweeping.jpg")),
                             SampleCardModel(title: "R3HAB", description: "#music", imageURL: URL(string: "https://www.laweekly.com/wp-content/uploads/2019/05/r3hab-20180528-jochem-schuiling-2s1a4312.jpg")),
                             SampleCardModel(title: "Darlene Love", description: "#music", imageURL: URL(string: "https://bandstours.net/uploads/artist/image/3501/darlene-love.jpeg")),
                             SampleCardModel(title: "Chase Rice", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/00/Chase_Rice.jpg")),
                             SampleCardModel(title: "Kris Kross Amsterdam", description: "#music", imageURL: URL(string: "https://edm.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cq_auto:good%2Cw_1200/MTY2NTg3ODAzMTcyMzQ5Mjcw/kris-kross-amsterdam-press-photo.png")),
                             SampleCardModel(title: "DJ ESCO", description: "#music", imageURL: URL(string: "https://nightout.s3.amazonaws.com/media/posters/45340/large-d2596a5514f8021e.png?1525938719")),
                             SampleCardModel(title: "Lauren Daigle", description: "#music", imageURL: URL(string: "https://bloximages.newyork1.vip.townnews.com/theadvocate.com/content/tncms/assets/v3/editorial/a/0e/a0ef63a0-99b5-11e8-8e83-1b9e1347c73a/5b68aca84a807.image.jpg")),
                             SampleCardModel(title: "K CAMP", description: "#music", imageURL: URL(string: "https://iscale.iheart.com/catalog/artist/735492")),
                             SampleCardModel(title: "Shawn Hook", description: "#music", imageURL: URL(string: "https://synchtank-cdn.s3.amazonaws.com/file_objects/7941852.jpg?AWSAccessKeyId=AKIAJ6ZPUHE3OSXWQSTA&Expires=1896716986&Signature=ES8WkAH7w5kdmvXNAkh7xMWFODE%3D")),
                             SampleCardModel(title: "MEDUZA", description: "#music", imageURL: URL(string: "https://static1.squarespace.com/static/55f9ade5e4b0fceefecad5ec/59b0932559cc68f4ceb76e98/5df3026e50aa3509bb5358ae/1576208128604/Meduza+lose+control+press+shot.png?format=1500w")),
                             SampleCardModel(title: "Natti Natasha", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2019/03/natti-natasha.jpg")),
                             SampleCardModel(title: "Alok", description: "#music", imageURL: URL(string: "https://www.correiodopovo.com.br/image/policy:1.373376:1571336486/.jpg?f=default&$p$f=53ee086")),
                             SampleCardModel(title: "The Lumineers", description: "#music", imageURL: URL(string: "https://bloximages.chicago2.vip.townnews.com/siouxcityjournal.com/content/tncms/assets/v3/editorial/e/ed/eedd508b-9c4c-5304-97a8-cb922b79f411/58c9636224f97.image.jpg")),
                             SampleCardModel(title: "Zacari", description: "#music", imageURL: URL(string: "https://mtv.mtvnimages.com/uri/mgid:ao:image:mtv.com:669951?quality=0.8&format=jpg")),
                             SampleCardModel(title: "Zay Hilfigerrr", description: "#music", imageURL: URL(string: "https://i.ytimg.com/vi/bVH7mYY92kE/maxresdefault.jpg")),
                             SampleCardModel(title: "Nas", description: "#music", imageURL: URL(string: "https://hauteliving.com/wp-content/uploads/2019/10/04_0278-Edit.jpg")),
                             SampleCardModel(title: "Moneybagg Yo", description: "#music", imageURL: URL(string: "https://nightout.s3.amazonaws.com/media/posters/46629/large-b5a0385f3efe2e2a.jpg?1529361917")),
                             SampleCardModel(title: "Mason Ramsey", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2019/07/MR-Twang-Main-Promo-Nick-Swift-Hi-Res_re.jpg?resize=1800,1200&w=1800")),
                             SampleCardModel(title: "Danny Ocean", description: "#music", imageURL: URL(string: "https://media2.s-nbcnews.com/i/newscms/2018_34/2540456/180822-danny-ocean-416p-na_f1428aa09e4ab6e1dade6ed22c398655.jpg")),
                             SampleCardModel(title: "Josh Turner", description: "#music", imageURL: URL(string: "https://www.gannett-cdn.com/presto/2020/03/25/PMOY/0196fece-4ea5-408c-b2fe-dee5006c0115-JOSH_TURNER.jpg?crop=2933,2933,x66,y0")),
                             SampleCardModel(title: "YBN Cordae", description: "#music", imageURL: URL(string: "https://cdn.wegow.com/media/artists/ybn-cordae/ybn-cordae-1539698623.53.2560x1440.jpg")),
                             SampleCardModel(title: "Chris Young", description: "#music", imageURL: URL(string: "https://parade.com/wp-content/uploads/2017/02/Chris-Young-Headshot.jpg")),
                             SampleCardModel(title: "Paramore", description: "#music", imageURL: URL(string: "https://miro.medium.com/max/4000/1*tyMX6lLtW0YW2wz9PeHFiQ.jpeg")),
                             SampleCardModel(title: "Lukas Graham", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b0/Lukas_Graham_Warner_Bros_press_photo.jpg")),
                             SampleCardModel(title: "Jeremih", description: "#music", imageURL: URL(string: "https://cdn.hipwallpaper.com/i/72/93/mpoeij.jpg")),
                             SampleCardModel(title: "Jorja Smith", description: "#music", imageURL: URL(string: "https://indie-mag.com/wp-content/uploads/2018/09/010_081_v2_RGB.jpg")),
                             SampleCardModel(title: "Trey Songz", description: "#music", imageURL: URL(string: "https://img.srgcdn.com/e//UnI0c21wU2xjWDdCYjV3T0w2cEkucG5n.jpg")),
                             SampleCardModel(title: "Sofia Reyes", description: "#music", imageURL: URL(string: "https://images.hdqwalls.com/wallpapers/sofia-reyes-4k-o4.jpg")),
                             SampleCardModel(title: "Kevin Gates", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/7b/Kevin_Gates_-_Main_Pub_1_-_Photo_Credit.jpg")),
                             SampleCardModel(title: "TOOL", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/tool-new-album-aeb79008-af4d-443e-86ca-da43cadf1ab1.jpg")),
                             SampleCardModel(title: "VÉRITÉ", description: "#music", imageURL: URL(string: "https://2l7g9kgsh281akevs49v281d-wpengine.netdna-ssl.com/wp-content/uploads/2018/02/image-e1519603118657.jpg")),
                             SampleCardModel(title: "Cash Cash", description: "#music", imageURL: URL(string: "https://musicpleermart.com/wp-content/uploads/2019/04/Cash-Cash.jpg")),
                             SampleCardModel(title: "FRENSHIP", description: "#music", imageURL: URL(string: "https://milk.imgix.net/2019/02/unnamed-24.jpg?auto=format&fit=scale&h=1055&ixlib=php-1.1.0&q=95&w=800&wpsize=ngfb-schema&s=c672df03222bffe0137cf755a137956d")),
                             SampleCardModel(title: "lovelytheband", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/10/Lovelytheband-2018-portrait.jpg?resize=1800,1200&w=1800")),
                             SampleCardModel(title: "Anderson .Paak", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/37/Anderson_.Paak.jpg")),
                             SampleCardModel(title: "Ab-Soul", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2d/Ab-Soul_-_AfroPunk_Festival_2015.jpg")),
                             SampleCardModel(title: "KREAM", description: "#music", imageURL: URL(string: "https://pm1.narvii.com/6453/857d5f6f2bdc298ec3763e1cda6506fc7511c266_hq.jpg")),
                             SampleCardModel(title: "Pharrell Williams", description: "#music", imageURL: URL(string: "https://news.virginia.edu/sites/default/files/article_image/pharrell_williams_header_3-2.jpg")),
                             SampleCardModel(title: "Peter Manos", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2019/02/peter-manos-press-photo.jpg")),
                             SampleCardModel(title: "The 1975", description: "#music", imageURL: URL(string: "https://img.apmcdn.org/e57270ef1f77a2453f4605fb953f8726b67a68f2/square/5e558a-20151217-the-1975.jpg")),
                             SampleCardModel(title: "Marc E. Bassy", description: "#music", imageURL: URL(string: "https://img-dev.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F78684535%2F324124700193%2F1%2Foriginal.20191029-213348?auto=compress&fit=clip&h=&w=960&s=c974427ce122c6f7d42149c8b81ed9f7")),
                             SampleCardModel(title: "Tony Bennett", description: "#music", imageURL: URL(string: "https://cdn.britannica.com/26/144426-050-050759E3/Tony-Bennett.jpg")),
                             SampleCardModel(title: "Labrinth", description: "#music", imageURL: URL(string: "https://data.mothership.tools/mothershiptools-ukprod/wp-content/uploads/2019/09/labrinth-landscape.jpg")),
                             SampleCardModel(title: "Eli Young Band", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/a/a2/Mike_Eli_from_The_Eli_Young_Band.jpg")),
                             SampleCardModel(title: "James Bay", description: "#music", imageURL: URL(string: "https://media.wonderlandmagazine.com/uploads/2019/05/jbay.jpg")),
                             SampleCardModel(title: "Loote", description: "#music", imageURL: URL(string: "https://xodivad.files.wordpress.com/2017/08/loote_06-11resized_photocredit-meredithtruax.jpg")),
                             SampleCardModel(title: "Thomas Gold", description: "#music", imageURL: URL(string: "https://media.watchthedj.com/djs/thomas-gold.jpg")),
                             SampleCardModel(title: "Ashnikko", description: "#music", imageURL: URL(string: "https://equatemagazine.com/wp-content/uploads/2019/10/Screen-Shot-2019-10-28-at-15.28.04-1000x1503.png")),
                             SampleCardModel(title: "DJ Luian", description: "#music", imageURL: URL(string: "https://marriedbiography.com/wp-content/uploads/2018/10/DJ-Luian-3-1200x1500.jpg")),
                             SampleCardModel(title: "Matt Terry", description: "#music", imageURL: URL(string: "https://store.intertalentgroup.com/ck-images/Screen-Shot-Matt-Terry.png")),
                             SampleCardModel(title: "The Pogues", description: "#music", imageURL: URL(string: "https://www.thesun.ie/wp-content/uploads/sites/3/2017/05/gettyimages-113407018jpg-js276187325-e1494425308333.jpg")),
                             SampleCardModel(title: "Grey", description: "#music", imageURL: URL(string: "https://miro.medium.com/max/4096/1*KVilWLRQRIdO-4KmuBkSnw.jpeg")),
                             SampleCardModel(title: "Ray Parker Jr.", description: "#music", imageURL: URL(string: "https://townsquare.media/site/40/files/2013/10/3296186-e1381153755499.jpg?w=980&q=75")),
                             SampleCardModel(title: "Walker Hayes", description: "#music", imageURL: URL(string: "https://www.soundslikenashville.com/wp-content/uploads/2019/05/Walker-Hayes-1a-1557844181.jpg")),
                             SampleCardModel(title: "The Kid LAROI", description: "#music", imageURL: URL(string: "https://www.the360mag.com/wp-content/uploads/2019/12/1575668329555.jpg")),
                             SampleCardModel(title: "Donny Hathaway", description: "#music", imageURL: URL(string: "https://static01.nyt.com/images/2019/07/23/arts/22hathaway/merlin_158184522_b00ead3c-41de-42c2-bdce-5942a912abbf-articleLarge.jpg?quality=75&auto=webp&disable=upscale")),
                             SampleCardModel(title: "Jess Glynne", description: "#music", imageURL: URL(string: "https://cdn.vox-cdn.com/thumbor/WkEdUpVGh_powBqtnHEie-5BGnw=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/13286973/akrales_180710_2687_0036.jpg")),
                             SampleCardModel(title: "22 Savage", description: "#music", imageURL: URL(string: "https://ssla.ulximg.com/image/amp_article_crop/cover/1474898058_4d67baddd75ebe2031f4bd88d842d12f.jpg/30356f26fd8ab1e744d7ae0eb062bc26/1474898058_a4bdb506baaa940593221ef5a9042e33.jpg")),
                             SampleCardModel(title: "Kelsea Ballerini", description: "#music", imageURL: URL(string: "https://www.nashcountrydaily.com/wp-content/uploads/sites/1446/2016/08/Kelsea_Ballerini_PR.jpg")),
                             SampleCardModel(title: "Charli XCX", description: "#music", imageURL: URL(string: "https://celebmafia.com/wp-content/uploads/2019/09/charli-xcx-spin-photoshoot-september-2019-5.jpg")),
                             SampleCardModel(title: "Chris Jeday", description: "#music", imageURL: URL(string: "https://i.scdn.co/image/709c3cb23c8a7377504690d70357e350ae8dc8f1")),
                             SampleCardModel(title: "MiC LOWRY", description: "#music", imageURL: URL(string: "https://bobbosblock.files.wordpress.com/2017/01/img_1639jpg1.jpg")),
                             SampleCardModel(title: "NexXthursday", description: "#music", imageURL: URL(string: "https://images.genius.com/68279259cabc6c1c2a01ed9841bcc5bc.1000x563x1.png")),
                             SampleCardModel(title: "Rich Brian", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/5a74702054cb6a6e81fe34df/3:4/w_2999,h_3999,c_limit/rich-brian-web-alex-reside13.jpg")),
                             SampleCardModel(title: "Solange", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/89/Solange_%28220707%29.jpg")),
                             SampleCardModel(title: "Delacey", description: "#music", imageURL: URL(string: "https://substreammagazine.com/wp-content/uploads/2020/03/delacey-alyssa-sarti-2000x1201.jpg")),
                             SampleCardModel(title: "Carnage", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/16/Carnage_2019_Press_Shot.jpg")),
                             SampleCardModel(title: "Meghan Trainor", description: "#music", imageURL: URL(string: "https://www.grammy.com/sites/com/files/styles/image_landscape_hero/public/muzooka/Meghan%2BTrainor/Meghan%2520Trainor_16_9_1578384657.jpg?itok=YYnpb7h8")),
                             SampleCardModel(title: "X Ambassadors", description: "#music", imageURL: URL(string: "https://static1.squarespace.com/static/535eb4d7e4b08c41d0c4ae5c/535ec13de4b0586b1fc80285/5d9ca47a93787b3270bd2286/1570606004993/X-Ambassadors-Sam-Harris-Interview-%28%40dannyscottlane%29.jpg?format=2500w")),
                             SampleCardModel(title: "Mozzy", description: "#music", imageURL: URL(string: "https://thefader-res.cloudinary.com/private_images/w_760,c_limit,f_auto,q_auto:eco/Fader_105_MOZZY_Dan_Monick20160619_0002_WEB_dfzzoz/mozzy-bladadah-sacramento-interview.jpg")),
                             SampleCardModel(title: "Dylan Scott", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/09/dylanscott-tour.jpg")),
                             SampleCardModel(title: "Galantis", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/c/c6/Galantis_%2843228984191%29.jpg")),
                             SampleCardModel(title: "Rex Orange County", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/5db86b7fb2ccb20008b49804/4:3/w_4383,h_3287,c_limit/GQ-ROC-8.jpg")),
                             SampleCardModel(title: "Years & Years", description: "#music", imageURL: URL(string: "https://www.theedgesusu.co.uk/wp-content/uploads/2016/04/Years-Years.-009.jpg")),
                             SampleCardModel(title: "88rising", description: "#music", imageURL: URL(string: "https://wallpapercave.com/wp/wp3653571.jpg")),
                             SampleCardModel(title: "Kid Cudi", description: "#music", imageURL: URL(string: "https://66.media.tumblr.com/1aa67e1e5285cd2fc0ecbf4d84e24fd7/tumblr_pqjg0zGrxO1qajbgq_1280.jpg")),
                             SampleCardModel(title: "Denzel Curry", description: "#music", imageURL: URL(string: "https://thefader-res.cloudinary.com/private_images/w_1440,c_limit,f_auto,q_auto:best/DVN088_Denzel_Curry_Fader_5-15-19_Selects-024_ftt0p4/denzel-curry-zuu-interview.jpg")),
                             SampleCardModel(title: "Nause", description: "#music", imageURL: URL(string: "https://resources.mynewsdesk.com/image/upload/c_limit,dpr_2.625,f_auto,h_700,q_auto,w_360/gkbns1jsgn6pfrdp1ng1.jpg")),
                             SampleCardModel(title: "Shoreline Mafia", description: "#music", imageURL: URL(string: "https://nightout.s3.amazonaws.com/media/posters/54525/large-968213e79a3a2d48.jpg?1549964120")),
                             SampleCardModel(title: "Belly", description: "#music", imageURL: URL(string: "https://m.media-amazon.com/images/M/MV5BMDk3NDIyMjctZDA4MS00ZDdiLWE2NWYtYzQwZGFmNGM2YmUyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTI5NjIyMw@@._V1_.jpg")),
                             SampleCardModel(title: "Tainy", description: "#music", imageURL: URL(string: "https://www.entornointeligente.com/wp-content/uploads/2020/03/injusta_2C_la_ley_que_prohibe_el_reggaeton_tainy.jpg")),
                             SampleCardModel(title: "Bhad Bhabie", description: "#music", imageURL: URL(string: "https://d.newsweek.com/en/full/1238421/bhad-bhabie-pub-photo-3-jimmy-fontaine.jpg?w=1600&h=1600&q=88&f=a610d9c688d2f8dea0864e2f589e058d")),
                             SampleCardModel(title: "Pardison Fontaine", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/5bf2e2083b35e71fc3e6cd7a/master/pass/Pardison-Fontaine-GQ-tout.jpg")),
                             SampleCardModel(title: "Trouble", description: "#music", imageURL: URL(string: "https://thefader-res.cloudinary.com/private_images/w_1440,c_limit,f_auto,q_auto:best/1_xvwqvc/trouble-edgewood-mike-will-ear-drummer-interview.jpg")),
                             SampleCardModel(title: "HRVY", description: "#music", imageURL: URL(string: "https://media.wonderlandmagazine.com/uploads/2020/01/EmptyName-2.jpg")),
                             SampleCardModel(title: "GASHI", description: "#music", imageURL: URL(string: "https://www.crookesmagazine.com/wp-content/uploads/2019/10/gashi1-scaled.jpg")),
                             SampleCardModel(title: "Glades", description: "#music", imageURL: URL(string: "https://www.euphoriazine.com/wp-content/uploads/2016/01/GLADES.jpg")),
                             SampleCardModel(title: "Chris Stapleton", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/rs-218504-R1251_FOB_QnA_Stapleton-A2.jpg")),
                             SampleCardModel(title: "Reik", description: "#music", imageURL: URL(string: "https://i-ticket.us/wp-content/uploads/2020/04/35437/reik.jpg")),
                             SampleCardModel(title: "Nick Jonas", description: "#music", imageURL: URL(string: "https://tvguide1.cbsistatic.com/i/2019/10/08/0165cf07-0cf1-4f41-ae37-8ea3b3a7fc8b/191007-nick-jonas-the-voice.jpg")),
                             SampleCardModel(title: "James Blake", description: "#music", imageURL: URL(string: "https://dazedimg-dazedgroup.netdna-ssl.com/2318/azure/dazed-prod/1250/8/1258496.jpg")),
                             SampleCardModel(title: "Bas", description: "#music", imageURL: URL(string: "https://assets.teenvogue.com/photos/5d27428784233d000819529a/1:1/w_1684,h_1684,c_limit/Bas.jpeg")),
                             SampleCardModel(title: "The xx", description: "#music", imageURL: URL(string: "https://static.standard.co.uk/s3fs-public/thumbnails/image/2018/05/25/09/the-xx.tif")),
                             SampleCardModel(title: "Cole Swindell", description: "#music", imageURL: URL(string: "https://mms.businesswire.com/media/20170222005564/en/571277/5/Cole_Swindell_Lish_2016_FGL_Admat%5B2%5D.jpg")),
                             SampleCardModel(title: "Leona Lewis", description: "#music", imageURL: URL(string: "https://api.time.com/wp-content/uploads/2015/09/leona-lewis-1_photo-credit_catie-laffoon.jpg")),
                             SampleCardModel(title: "Stormzy", description: "#music", imageURL: URL(string: "https://media.newyorker.com/photos/5d1b7af71c312c000878a349/master/pass/Smith-Stormzy.jpg")),
                             SampleCardModel(title: "James Hersey", description: "#music", imageURL: URL(string: "https://www.clashmusic.com/sites/default/files/field/image/JAMESHERSEY_lead_press-shot.jpg")),
                             SampleCardModel(title: "Maggie Rogers", description: "#music", imageURL: URL(string: "https://assets.teenvogue.com/photos/5cf168d1c7ee5a438863883d/master/w_2752,h_4128,c_limit/20190508_TV_MaggieRogers-0704.jpg")),
                             SampleCardModel(title: "SiR", description: "#music", imageURL: URL(string: "https://mtv.mtvnimages.com/uri/mgid:ao:image:mtv.com:682677?quality=0.8&format=jpg")),
                             SampleCardModel(title: "Likybo", description: "#music", imageURL: URL(string: "https://image.iheart.com/ihr-ingestion-pipeline-production-distrokid/20181116070637663/193666985498/resources/193666985498.JPG")),
                             SampleCardModel(title: "Kacey Musgraves", description: "#music", imageURL: URL(string: "https://media.gq.com/photos/5aaaec8b5bce6d4cf87088b5/master/pass/kacey-musgraves-ERD-03.jpg")),
                             SampleCardModel(title: "Jonathan Groff", description: "#music", imageURL: URL(string: "https://m.media-amazon.com/images/M/MV5BMTUzMDM1NzkxN15BMl5BanBnXkFtZTgwOTg0MzMwNDI@._V1_.jpg")),
                             SampleCardModel(title: "Janelle Monáe", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/a/ae/Janelle_Monae_Paris_Fashion_Week_Autumn_Winter_2019.jpg")),
                             SampleCardModel(title: "Surf Mesa", description: "#music", imageURL: URL(string: "https://lh3.googleusercontent.com/proxy/brKXg7dVP6hhUGdiVUktzzh8g9-kibgGlziPDPZY1grS99zw2ytFUnxw31dxKIn1FajBU692Fq6o_8TkhCxjn6UhGT0D8tPb1g_FBaGVKDNATUHell1NwBw")),
                             SampleCardModel(title: "Vampire Weekend", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/vampire-weekend-debut-album-abcc4ca0-a4df-4c7b-95ca-ad447c4142d2.jpg")),
                             SampleCardModel(title: "Jeezy", description: "#music", imageURL: URL(string: "https://www.theplace2.ru/cache/archive/young_jeezy/img/tab_YoungJeezy0316-gthumb-gwdata1200-ghdata1200-gfitdatamax.jpg")),
                             SampleCardModel(title: "Juicy J", description: "#music", imageURL: URL(string: "https://www.grammy.com/sites/com/files/styles/image_landscape_hero/public/muzooka/Juicy%2BJ/Juicy%2520J_16_9_1578384669.jpg?itok=TNUFYa_k")),
                             SampleCardModel(title: "Slipknot", description: "#music", imageURL: URL(string: "https://media1.fdncms.com/sacurrent/imager/u/original/22959551/slipknot-press-2019-cr-alexandria-crahan-conway-billboard-1548.jpg")),
                             SampleCardModel(title: "JID", description: "#music", imageURL: URL(string: "https://cdn.nashvillescene.com/files/base/scomm/nvs/image/2019/03/960w/JId_copy.5c91240de1cea.jpg")),
                             SampleCardModel(title: "Andy Grammer", description: "#music", imageURL: URL(string: "https://media1.fdncms.com/clevescene/imager/u/original/31414284/botw.jpg")),
                             SampleCardModel(title: "Arctic Monkeys", description: "#music", imageURL: URL(string: "https://www.dominomusic.com/res/WgXX/1200_1200/5A_9A---PC-Zackery-Michael---300dpi.jpg")),
                             SampleCardModel(title: "Kris Wu", description: "#music", imageURL: URL(string: "https://i.pinimg.com/originals/a4/71/5b/a4715b1e1b8c83f53ed48f641088663d.jpg")),
                             SampleCardModel(title: "Aventura", description: "#music", imageURL: URL(string: "https://remezcla.com/wp-content/uploads/2019/04/AVENTURA-2019_music.jpg")),
                             SampleCardModel(title: "Luh Kel", description: "#music", imageURL: URL(string: "https://pbs.twimg.com/media/D4w2y9GXkAEGbS_.jpg")),
                             SampleCardModel(title: "Kaash Paige", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/5a0a519a0abd0473f4c35f6b/1579633738753-693UNMPOLXA9QG801IPR/ke17ZwdGBToddI8pDm48kHpCQsJXKnOW334slJlzodt7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UQ9tQa8bW2DU9ZPZeMWNpsWgkAH27WlgvLdVW3FeXVwoJ14ubcdsY0uKwK2_j53OFw/image-asset.jpeg?format=1000w")),
                             SampleCardModel(title: "Mitchell Tenpenny", description: "#music", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/00/MitchellTenpenny.jpg")),
                             SampleCardModel(title: "HAIM", description: "#music", imageURL: URL(string: "https://www.rollingstone.com/wp-content/uploads/2018/06/haim-sisters-in-arms-2017-rolling-stone-feature-aac09581-eda4-48c2-a9e9-e6ae0ea7fe02.jpg")),
                             SampleCardModel(title: "Thirty Seconds To Mars", description: "#music", imageURL: URL(string: "https://www.grammy.com/sites/com/files/styles/news_detail_header/public/news/thirty-seconds-to-mars-2013.jpg?itok=zB0Q0dv9")),
                             SampleCardModel(title: "ODESZA", description: "#music", imageURL: URL(string: "https://d279m997dpfwgl.cloudfront.net/wp/2018/01/0126_odesza.jpg")),
                             SampleCardModel(title: "WizKid", description: "#music", imageURL: URL(string: "https://iscale.iheart.com/catalog/artist/657868")),
                             SampleCardModel(title: "Soundgarden", description: "#music", imageURL: URL(string: "https://media.npr.org/assets/img/2017/05/18/289_soundgarden-otherimage1_wide-ee8ed1cecb17374fef2c7b25e1fb16e6db149fe6.jpg?s=1400")),
                             SampleCardModel(title: "Little Big Town", description: "#music", imageURL: URL(string: "https://www.soundslikenashville.com/wp-content/uploads/2020/01/Little-Big-Town-1579206440.jpg")),
                             SampleCardModel(title: "DNCE", description: "#music", imageURL: URL(string: "https://www.nme.com/wp-content/uploads/2018/08/DNCE-bandshot.jpg")),
                             SampleCardModel(title: "Maty Noyes", description: "#music", imageURL: URL(string: "https://images.squarespace-cdn.com/content/v1/52179953e4b090faa01ed7d8/1533924998678-GVSU0MSPLYQ0QCE218F1/ke17ZwdGBToddI8pDm48kBqZKGEd5IotpaYmRYDAsV97gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UYXHvO3AlG5qAFDx5BBWbEnTecsx1VxL9XkiyXErq2cftN_KfIuurh-w-x7bjNuMJA/FRO_4466.jpg?format=1500w")),
                             SampleCardModel(title: "Roy Woods", description: "#music", imageURL: URL(string: "https://image-ticketfly.imgix.net/00/02/69/99/10-og.jpg?w=1365&h=2048")),]

    
    static let oPrimary = UIColor(red: 0.96, green: 0.00, blue: 0.34, alpha: 1.00)
    static let oSecondary = UIColor(red: 0.09, green: 0.47, blue: 0.95, alpha: 1.00)
    
    
    static let oGray = UIColor(red:0.905, green:0.91, blue:0.925, alpha:1.0)
    static let oGrayLight = UIColor(red:0.94, green:0.95, blue:0.96, alpha:1.0)
    
    static let oBlack = UIColor(red:0.08, green:0.09, blue:0.10, alpha:1.0)
    
    
    static let bottomPopUpAttributes : EKAttributes = {
        var attributes = EKAttributes.bottomFloat
        attributes.hapticFeedbackType = EKAttributes.NotificationHapticFeedback.none
        attributes.displayDuration = .infinity
        attributes.screenBackground = .color(color: EKColor(UIColor.black.withAlphaComponent(0.8)))
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
        attributes.roundCorners = .all(radius: 18.0)
        attributes.entranceAnimation = .init(translate: .init(duration: 0.4, spring: .init(damping: 1, initialVelocity: 0)))
        attributes.statusBar = .light
        
        attributes.exitAnimation = .init(translate: .init(duration: 0.15))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.2)))
        attributes.positionConstraints.size = .init(width: .offset(value: 10), height: .intrinsic)
        attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .constant(value: UIScreen.main.bounds.height))
        
        return attributes
    }()
    
    static let centerPopUpAttributes : EKAttributes = {
        var attributes = EKAttributes.centerFloat
        attributes.hapticFeedbackType = EKAttributes.NotificationHapticFeedback.none
        attributes.displayDuration = .infinity
        attributes.screenBackground = .color(color: EKColor(UIColor.black.withAlphaComponent(0.8)))
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
        attributes.roundCorners = .all(radius: 18.0)
        attributes.entranceAnimation = .init(translate: .init(duration: 0.4, spring: .init(damping: 1, initialVelocity: 0)))
        attributes.statusBar = .light
        
        attributes.exitAnimation = .init(translate: .init(duration: 0.15))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.2)))
        attributes.positionConstraints.size = .init(width: .offset(value: 20), height: .intrinsic)
        attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .constant(value: UIScreen.main.bounds.height))
        
        return attributes
    }()
    
    static func fixedPopUpAttributes(heightWidthRatio : CGFloat) -> EKAttributes {
        var attributes = EKAttributes.bottomFloat
        attributes.displayDuration = .infinity
        attributes.screenBackground = .color(color: EKColor(UIColor.black.withAlphaComponent(0.8)))
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
        attributes.roundCorners = .all(radius: 18.0)
        attributes.entranceAnimation = .init(translate: .init(duration: 0.4, spring: .init(damping: 1, initialVelocity: 0)))
        attributes.statusBar = .light
        
        attributes.exitAnimation = .init(translate: .init(duration: 0.15))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.2)))
        attributes.positionConstraints.size = .init(width: .offset(value: 10), height: .constant(value: UIScreen.main.bounds.width * heightWidthRatio))
        attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .constant(value: UIScreen.main.bounds.height))
        
        return attributes
    }
}


extension UIImage {
    
    /// Returns a image that fills in newSize
    func resizedImage(newSize: CGSize) -> UIImage {
        // Guard newSize is different
        guard self.size != newSize else { return self }
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func aspectResizedImage (newHeight: CGFloat) -> UIImage {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}





class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView?.sd_cancelCurrentImageLoad()
    }
}

class AccessoryTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView?.sd_cancelCurrentImageLoad()
    }
}







extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: paddingTop))
        }
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: paddingLeft))
        }
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom))
        }
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -paddingRight))
        }
        if width > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: width))
        }
        if height > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: height))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
    @discardableResult
    func anchorToSuperview() -> [NSLayoutConstraint] {
        return anchor(top: superview?.topAnchor, left: superview?.leftAnchor, bottom: superview?.bottomAnchor, right: superview?.rightAnchor)
    }
}

extension UIView {
    
    func applyShadow(radius: CGFloat, opacity: Float, offset: CGSize, color: UIColor = .black) {
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
    
}
