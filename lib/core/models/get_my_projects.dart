// To parse this JSON data, do
//
//     final getProjectsModel = getProjectsModelFromJson(jsonString);

import 'dart:convert';

GetProjectsModel getProjectsModelFromJson(String str) => GetProjectsModel.fromJson(json.decode(str));

String getProjectsModelToJson(GetProjectsModel data) => json.encode(data.toJson());

class GetProjectsModel {
    List<ProjectsResult>? result;

    GetProjectsModel({
        this.result,
    });

    factory GetProjectsModel.fromJson(Map<String, dynamic> json) => GetProjectsModel(
        result: json["result"] == null ? [] : List<ProjectsResult>.from(json["result"]!.map((x) => ProjectsResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class ProjectsResult {
    int? id;
    dynamic name;
    dynamic desc;
    dynamic date;
    dynamic state;

    ProjectsResult({
        this.id,
        this.name,
        this.desc,
        this.date,
        this.state,
    });

    factory ProjectsResult.fromJson(Map<String, dynamic> json) => ProjectsResult(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        date: json["date"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "date": date,
        "state": state,
    };
}
