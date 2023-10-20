import 'dart:convert';

import 'FetchPortalTeamModel.dart';
// import 'package:sm_ventures/Model/PublicFeedBean.dart';
//
// import '../Model/FetchBlogsModel.dart';
// import 'base.dart';

class FetchPortalTeam {
  // static final http.Client httpClient = http.Client();

  static Future<FetchPorttalTeamModel?> fetchPortalTeam() async {
    /*final response = await httpClient.post(Uri.parse(Base.baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"mappingUrl": "getPoratlTeam", "sessionEmail": ""}));
    final json = jsonDecode(response.body);*/
    final json = {
      "portalTeam": [
        {
          "member_designation": "CEO",
          "member_id": 1,
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/selvan.png",
          "blog_url": "",
          "twitter_url": "https://twitter.com/SelvanRajan",
          "status": "Y",
          "member_name": "Selvan Rajan",
          "about_member_text":
              "A technologist entrepreneur who is always thinking how to bring technology to people to make them more powerful and resourceful than they are. He worked for BEA Systems, Accenture, Washington Mutual, Wells Fargo, Capital One, Sony, Google, and Uber. \n  He received EMBA from TRIUM EMBA and has Master in Science in Math and Bachelor of Science in Math, Physics, Statistics & CS from Bharathidasan University and Madras University respectively.",
          "linkedin_url": "https://www.linkedin.com/in/selvanrajan/"
        },
        {
          "member_name": "Leticia Garcia",
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/Leticia-Garcia.png",
          "about_member_text":
              "Executive leader with diverse experience in corporate strategy, operations, change management, global software implementations, human resource management, finance, and marketing.Has EMBA from TRIUM EMBA program jointly offered by London School of Economics, New York University Stern and HEC Paris. She went to Santa Clara University.",
          "facebook_url": null,
          "member_id": 2,
          "member_aligned_groups": "Executives",
          "blog_url": "",
          "status": "Y",
          "linkedin_url": "",
          "twitter_url": "",
          "member_designation": "VP Release Management & QA"
        },
        {
          "twitter_url": "https://twitter.com/TwitsOfVenkat",
          "facebook_url": null,
          "member_id": 3,
          "member_aligned_groups": "Executives",
          "about_member_text":
              "Over 28+ years of experience in Building Software. More than 4+ years of experience in delivering Mobile Applications on multiple platforms.  Architectural Experience in Cross Platform Mobile Applications and highly scalable backend software  Architected and built many products in Mobile Technology in domains such as Sales Field Force, FMCG, Utility, Finance, Insurance etc. Delivered and serviced more than few dozen multinational customers in the last five years. This includes customers in USA, Australia, UK, Middle East, South Africa etc.  Conceptualized and architected Mobility Application Development Framework.",
          "status": "Y",
          "blog_url": "http://Venkat-Alagarsamy.blogspot.com",
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/Venkat.jpg",
          "member_designation": "VP Engineering",
          "linkedin_url": "https://www.linkedin.com/in/venkatalagarsamy/",
          "member_name": "Venkat Alagarsamy"
        },
        {
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "member_id": 4,
          "blog_url": "",
          "status": "Y",
          "member_name": "Varsha Jain",
          "linkedin_url": "https://www.linkedin.com/in/varsha-jain-41a63024/",
          "about_member_text":
              " Varsha has extensive experience in financial and valuation analysis. She worked at Amazon as a Senior Financial Operations Analyst at their Global Financial Operations division. She was responsible for vendor financial management.\r  Varsha has Masters in Investment and Financial Analysis, Investments and Securities and  Chartered Financial Analyst, Financial Analysis from ICFAI. She also has an MBA in Accounting and Finance from Regional College of Management, Bhubaneswar. She did her Bachelors in Commerce from Berhampur University.",
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/Varsha.png",
          "twitter_url": "",
          "member_designation": "Manager Investments & Analysis"
        },
        {
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/PaulVezolles.png",
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "blog_url": null,
          "member_id": 6,
          "status": "Y",
          "member_designation": "Investor/Advisor",
          "linkedin_url": null,
          "twitter_url": null,
          "about_member_text":
              "Versatile and accomplished veteran financial services leader with a successful track-record of managing client service & partner relationships, people and teams, and initiatives related to investment product development & management, investment operations and technology.",
          "member_name": "Paul Vezolles"
        },
        {
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/OlatowunCandide-Johnson.png",
          "blog_url": null,
          "status": "Y",
          "member_id": 7,
          "member_name": "Olatowun Candide-Johnson",
          "member_designation": "Investor/Advisor",
          "about_member_text":
              "Olatowun Candide-Johnson is a Nigerian lawyer and entrepreneur who specialized in Oil and Gas law and Governance for multinational companies, and has several years of experience in senior management roles within the Total Group in Nigeria and in France. She is the Founder and CEO of GAIA Women Club, a business & social Club in Lagos, Nigeria for Women Leaders. Olatowun earned an MBA from the TRIUM Global Executive MBA program in 2016.  The TRIUM Global Executive MBA is a joint award from the LSE, NYU Stern and HEC Paris.",
          "linkedin_url": null,
          "twitter_url": null
        },
        {
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "about_member_text":
              "Manan Rawal is the head of US model risk management at HSBC where he oversees a team responsible for prudent deployment of models covering pricing / valuation / credit loss forecasting / financial crime monitoring. He has spent the past 11 years in various risk management roles at HSBC and also spent time in institutional asset management prior to joining the bank.\n   Manan has a B.S. from the Wharton School, M.Sc. in Economics from the London School of Economics and an executive MBA from the Trium program. ",
          "blog_url": null,
          "status": "Y",
          "member_name": "Manan Rawal",
          "member_id": 8,
          "member_designation": "Investor/Advisor",
          "linkedin_url": null,
          "twitter_url": null,
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/MananRawal.png"
        },
        {
          "facebook_url": null,
          "member_name": "Angelo Noronha",
          "member_aligned_groups": "Executives",
          "blog_url": null,
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/AngeloNoronha.png",
          "status": "Y",
          "about_member_text":
              "Angelo is the President EMEA of Allianace Tire Europe, a group company of Yokohama Tires Corp. Previously, he was a General Manager of AMW Motors, India. Prior to that he was with Mahindra & Mahindra, & Tata Motors.\n   He has EMBA from TRIUM program with PGDM from SP Jain Institute of Management & Research and BS in Chemistry from Bombay University.",
          "member_designation": "Investor/Advisor",
          "member_id": 9,
          "linkedin_url": null,
          "twitter_url": null
        },
        {
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "blog_url": "",
          "member_designation": "Advisor",
          "member_name": "Susan Berman",
          "status": "Y",
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/SusanBerman.png",
          "member_id": 10,
          "linkedin_url": "",
          "twitter_url": "",
          "about_member_text": "  "
        },
        {
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "blog_url": "",
          "member_designation": "Advisor",
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/ClareHammond.png",
          "status": "Y",
          "member_id": 11,
          "linkedin_url": "",
          "member_name": "Clare Hammond",
          "twitter_url": "",
          "about_member_text": "   "
        },
        {
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/SmPortal/assets/img/companyPeoples/Jason.png",
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "blog_url": null,
          "member_designation": "Advisor",
          "status": "Y",
          "member_name": "Jason LaMacchia",
          "linkedin_url": null,
          "member_id": 12,
          "twitter_url": null,
          "about_member_text": "   "
        },
        {
          "member_designation": "Venture Partner",
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "blog_url": null,
          "status": "Y",
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/smco/jsp/mkt/v4/docs/assets/img/CompanyPeoples/BrysonKeeton.jpg",
          "member_name": "Bryson Keeton",
          "linkedin_url": null,
          "member_id": 13,
          "about_member_text":
              "A former NFL player and business operations consultant at Microsoft, boasting early-stage operational prowess and a Master's in Psychology. With a global mentorship reach of 500, his journey exemplifies versatility and achievement.",
          "twitter_url": null
        },
        {
          "member_designation": "Venture Partner",
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "blog_url": null,
          "status": "Y",
          "member_name": "Royston King",
          "linkedin_url": null,
          "twitter_url": null,
          "member_id": 14,
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/smco/jsp/mkt/v4/docs/assets/img/CompanyPeoples/RoystonKing.jpg",
          "about_member_text":
              "A Forbes 30 Under 30 awardee from Monaco with 15+ million followers. With a background as an ex-Bain & Co. consultant and degrees from University of Southern California and the University of Melbourne, he's a versatile advisor, investor, partner, and C-suite executive. Royston's journey epitomizes innovation and achievement across academia and the business landscape."
        },
        {
          "about_member_text":
              "Venture Capital Analyst with mastery in Valuation, Due Diligence, and Prompt Engineering. Expertise lies in combining rigorous financial assessment with deep-rooted analytics to identify and evaluate potential investment opportunities. Renowned for executing quantitative valuations, overseeing comprehensive due diligence processes, and utilizing prompt engineering techniques. Holds a robust track record in project management, inter-departmental collaboration, and delivering actionable insights to drive informed investment decisions and optimize fund performance.",
          "member_designation": "Venture Partner",
          "facebook_url": null,
          "member_aligned_groups": "Executives",
          "blog_url": null,
          "member_image_file_name": "https://storage.googleapis.com/smco-web-static-assets/smco/jsp/mkt/v4/docs/assets/img/CompanyPeoples/Blessing.jpg",
          "status": "Y",
          "member_name": "Blessing Igbokwe",
          "linkedin_url": null,
          "twitter_url": null,
          "member_id": 15
        }
      ]
    };
    print("portal Team Details " + json.toString());
    if (json != null && json.length > 0) {
      //FeedOrTimeLineJsonParser blogs = FeedOrTimeLineJsonParser.fromJson(json);
      FetchPorttalTeamModel feeds = FetchPorttalTeamModel.fromJson(json);
      return feeds;
    } else {
      return null;
    }
  }
}
