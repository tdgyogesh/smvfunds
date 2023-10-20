import 'dart:convert';

FetchPorttalTeamModel officerAndDirectorsModelFromJson(String str) => FetchPorttalTeamModel.fromJson(json.decode(str));

String officerAndDirectorsModelToJson(FetchPorttalTeamModel data) => json.encode(data.toJson());

class FetchPorttalTeamModel {
  FetchPorttalTeamModel({
    required this.getPortaTeamData,
  });

  List<FetchPortalJson> getPortaTeamData;

  factory FetchPorttalTeamModel.fromJson(Map<String, dynamic> json) => FetchPorttalTeamModel(
        getPortaTeamData: List<FetchPortalJson>.from(json["portalTeam"].map((x) => FetchPortalJson.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "portalTeam": List<dynamic>.from(getPortaTeamData.map((x) => x.toJson())),
      };
}

class FetchPortalJson {
  FetchPortalJson({
    this.memberDesignation,
    this.memberId,
    this.facebookUrl,
    this.memberAlignedGroups,
    this.memberImageFileName,
    this.blogUrl,
    this.twitterUrl,
    this.status,
    this.memberName,
    this.aboutMemberText,
    this.linkedinUrl,
  });

  String? memberDesignation;
  String? memberId;
  String? facebookUrl;
  String? memberAlignedGroups;
  String? memberImageFileName;
  String? blogUrl;
  String? twitterUrl;
  String? status;
  String? memberName;
  String? aboutMemberText;
  String? linkedinUrl;

  factory FetchPortalJson.fromJson(Map<String, dynamic> json) => FetchPortalJson(
        memberDesignation: json["member_designation"].toString() ?? "",
        memberId: json["member_id"].toString() ?? "",
        facebookUrl: json["facebook_url"].toString() ?? "",
        memberAlignedGroups: json["member_aligned_groups"] ?? "",
        memberImageFileName: json["member_image_file_name"],
        blogUrl: json["blog_url"].toString() ?? "",
        twitterUrl: json["twitter_url"].toString() ?? "",
        status: json["status"].toString() ?? "",
        memberName: json["member_name"] ?? "",
        aboutMemberText: json["about_member_text"] ?? "",
        linkedinUrl: json!["linkedin_url"].toString() ?? "",
      );

  Map<String, dynamic> toJson() => {
        "member_designation": memberDesignation,
        "member_id": memberId,
        "facebook_url": facebookUrl,
        "member_aligned_groups": memberAlignedGroups,
        "member_image_file_name": memberImageFileName,
        "blog_url": blogUrl,
        "twitter_url": twitterUrl,
        "status": status,
        "member_name": memberName,
        "about_member_text": aboutMemberText,
        "linkedin_url": linkedinUrl,
      };
}
