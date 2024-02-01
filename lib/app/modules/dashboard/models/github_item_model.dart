import 'dart:convert';

GithubItemModel githubItemModelFromJson(String str) =>
    GithubItemModel.fromJson(json.decode(str));

String githubItemModelToJson(GithubItemModel data) =>
    json.encode(data.toJson());

class GithubItemModel {
  int totalCount;
  bool incompleteResults;
  List<GitHubItem> items;

  GithubItemModel({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory GithubItemModel.fromJson(Map<String, dynamic> json) =>
      GithubItemModel(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<GitHubItem>.from(
            json["items"].map((x) => GitHubItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class GitHubItem {
  int id;
  // String nodeId;
  String name;
  // String fullName;
  // bool private;
  Owner owner;
  // String htmlUrl;
  String description;
  // bool fork;
  // String url;
  // String forksUrl;
  // String keysUrl;
  // String collaboratorsUrl;
  // String teamsUrl;
  // String hooksUrl;
  // String issueEventsUrl;
  // String eventsUrl;
  // String assigneesUrl;
  // String branchesUrl;
  // String tagsUrl;
  // String blobsUrl;
  // String gitTagsUrl;
  // String gitRefsUrl;
  // String treesUrl;
  // String statusesUrl;
  // String languagesUrl;
  // String stargazersUrl;
  // String contributorsUrl;
  // String subscribersUrl;
  // String subscriptionUrl;
  // String commitsUrl;
  // String gitCommitsUrl;
  // String commentsUrl;
  // String issueCommentUrl;
  // String contentsUrl;
  // String compareUrl;
  // String mergesUrl;
  // String archiveUrl;
  // String downloadsUrl;
  // String issuesUrl;
  // String pullsUrl;
  // String milestonesUrl;
  // String notificationsUrl;
  // String labelsUrl;
  // String releasesUrl;
  // String deploymentsUrl;
  // DateTime createdAt;
  DateTime updatedAt;
  // DateTime pushedAt;
  // int size;
  int stargazersCount;
  // int watchersCount;
  // String? language;
  // bool hasIssues;
  // bool hasProjects;
  // bool hasDownloads;
  // bool hasWiki;
  // bool hasPages;
  // bool hasDiscussions;
  int forksCount;
  // dynamic mirrorUrl;
  // bool archived;
  // bool disabled;
  // int openIssuesCount;
  // License? license;
  // bool allowForking;
  // bool isTemplate;
  // bool webCommitSignoffRequired;
  // List<String> topics;
  // int forks;
  // int openIssues;
  // int watchers;
  double score;

  GitHubItem({
    required this.id,
    // required this.nodeId,
    required this.name,
    // required this.fullName,
    // required this.private,
    required this.owner,
    // required this.htmlUrl,
    required this.description,
    // required this.fork,
    // required this.url,
    // required this.forksUrl,
    // required this.keysUrl,
    // required this.collaboratorsUrl,
    // required this.teamsUrl,
    // required this.hooksUrl,
    // required this.issueEventsUrl,
    // required this.eventsUrl,
    // required this.assigneesUrl,
    // required this.branchesUrl,
    // required this.tagsUrl,
    // required this.blobsUrl,
    // required this.gitTagsUrl,
    // required this.gitRefsUrl,
    // required this.treesUrl,
    // required this.statusesUrl,
    // required this.languagesUrl,
    // required this.stargazersUrl,
    // required this.contributorsUrl,
    // required this.subscribersUrl,
    // required this.subscriptionUrl,
    // required this.commitsUrl,
    // required this.createdAt,
    required this.updatedAt,
    // required this.pushedAt,
    // required this.gitCommitsUrl,
    // required this.commentsUrl,
    // required this.issueCommentUrl,
    // required this.contentsUrl,
    // required this.compareUrl,
    // required this.mergesUrl,
    // required this.archiveUrl,
    // required this.downloadsUrl,
    // required this.issuesUrl,
    // required this.pullsUrl,
    // required this.milestonesUrl,
    // required this.notificationsUrl,
    // required this.labelsUrl,
    // required this.releasesUrl,
    // required this.deploymentsUrl,
    // required this.size,
    required this.stargazersCount,
    // required this.watchersCount,
    // required this.language,
    // required this.hasIssues,
    // required this.hasProjects,
    // required this.hasDownloads,
    // required this.hasWiki,
    // required this.hasPages,
    // required this.hasDiscussions,
    required this.forksCount,
    // required this.mirrorUrl,
    // required this.archived,
    // required this.disabled,
    // required this.openIssuesCount,
    // required this.license,
    // required this.allowForking,
    // required this.isTemplate,
    // required this.webCommitSignoffRequired,
    // required this.topics,
    // required this.forks,
    // required this.openIssues,
    // required this.watchers,
    required this.score,
  });

  factory GitHubItem.fromJson(Map<String, dynamic> json) => GitHubItem(
        id: json["id"],
        // nodeId: json["node_id"],
        name: json["name"],
        // fullName: json["full_name"],
        // private: json["private"],
        owner: Owner.fromJson(json["owner"]),
        // htmlUrl: json["html_url"],
        description: json["description"]??'',
        // fork: json["fork"],
        // url: json["url"],
        // forksUrl: json["forks_url"],
        // keysUrl: json["keys_url"],
        // collaboratorsUrl: json["collaborators_url"],
        // teamsUrl: json["teams_url"],
        // hooksUrl: json["hooks_url"],
        // issueEventsUrl: json["issue_events_url"],
        // eventsUrl: json["events_url"],
        // assigneesUrl: json["assignees_url"],
        // branchesUrl: json["branches_url"],
        // tagsUrl: json["tags_url"],
        // blobsUrl: json["blobs_url"],
        // gitTagsUrl: json["git_tags_url"],
        // gitRefsUrl: json["git_refs_url"],
        // treesUrl: json["trees_url"],
        // statusesUrl: json["statuses_url"],
        // languagesUrl: json["languages_url"],
        // stargazersUrl: json["stargazers_url"],
        // contributorsUrl: json["contributors_url"],
        // subscribersUrl: json["subscribers_url"],
        // subscriptionUrl: json["subscription_url"],
        // commitsUrl: json["commits_url"],
        // gitCommitsUrl: json["git_commits_url"],
        // commentsUrl: json["comments_url"],
        // issueCommentUrl: json["issue_comment_url"],
        // contentsUrl: json["contents_url"],
        // compareUrl: json["compare_url"],
        // mergesUrl: json["merges_url"],
        // archiveUrl: json["archive_url"],
        // downloadsUrl: json["downloads_url"],
        // issuesUrl: json["issues_url"],
        // pullsUrl: json["pulls_url"],
        // createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // pushedAt: DateTime.parse(json["pushed_at"]),
        // milestonesUrl: json["milestones_url"],
        // notificationsUrl: json["notifications_url"],
        // labelsUrl: json["labels_url"],
        // releasesUrl: json["releases_url"],
        // deploymentsUrl: json["deployments_url"],
        // size: json["size"],
        stargazersCount: json["stargazers_count"]??0,
        // watchersCount: json["watchers_count"],
        // language: json["language"],
        // hasIssues: json["has_issues"],
        // hasProjects: json["has_projects"],
        // hasDownloads: json["has_downloads"],
        // hasWiki: json["has_wiki"],
        // hasPages: json["has_pages"],
        // hasDiscussions: json["has_discussions"],
        forksCount: json["forks_count"]??0,
        // mirrorUrl: json["mirror_url"],
        // archived: json["archived"],
        // disabled: json["disabled"],
        // openIssuesCount: json["open_issues_count"],
        // license:
        //     json["license"] == null ? null : License.fromJson(json["license"]),
        // allowForking: json["allow_forking"],
        // isTemplate: json["is_template"],
        // webCommitSignoffRequired: json["web_commit_signoff_required"],
        // topics: List<String>.from(json["topics"].map((x) => x)),
        // forks: json["forks"],
        // openIssues: json["open_issues"],
        // watchers: json["watchers"],
        score: json["score"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "node_id": nodeId,
        "name": name,
        // "full_name": fullName,
        // "private": private,
        "owner": owner.toJson(),
        // "html_url": htmlUrl,
        "description": description,
        // "fork": fork,
        // "url": url,
        // "forks_url": forksUrl,
        // "keys_url": keysUrl,
        // "collaborators_url": collaboratorsUrl,
        // "teams_url": teamsUrl,
        // "hooks_url": hooksUrl,
        // "issue_events_url": issueEventsUrl,
        // "events_url": eventsUrl,
        // "assignees_url": assigneesUrl,
        // "branches_url": branchesUrl,
        // "tags_url": tagsUrl,
        // "blobs_url": blobsUrl,
        // "git_tags_url": gitTagsUrl,
        // "git_refs_url": gitRefsUrl,
        // "trees_url": treesUrl,
        // "statuses_url": statusesUrl,
        // "languages_url": languagesUrl,
        // "stargazers_url": stargazersUrl,
        // "contributors_url": contributorsUrl,
        // "subscribers_url": subscribersUrl,
        // "subscription_url": subscriptionUrl,
        // "commits_url": commitsUrl,
        // "git_commits_url": gitCommitsUrl,
        // "comments_url": commentsUrl,
        // "issue_comment_url": issueCommentUrl,
        // "contents_url": contentsUrl,
        // "compare_url": compareUrl,
        // "merges_url": mergesUrl,
        // "archive_url": archiveUrl,
        // "downloads_url": downloadsUrl,
        // "issues_url": issuesUrl,
        // "pulls_url": pullsUrl,
        // "milestones_url": milestonesUrl,
        // "notifications_url": notificationsUrl,
        // "labels_url": labelsUrl,
        // "releases_url": releasesUrl,
        // "deployments_url": deploymentsUrl,
        // "size": size,
        "stargazers_count": stargazersCount,
        // "watchers_count": watchersCount,
        // "language": language,
        // "has_issues": hasIssues,
        // "has_projects": hasProjects,
        // "has_downloads": hasDownloads,
        // "has_wiki": hasWiki,
        // "has_pages": hasPages,
        // "has_discussions": hasDiscussions,
        "forks_count": forksCount,
        // "mirror_url": mirrorUrl,
        // "archived": archived,
        // "disabled": disabled,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        // "pushed_at": pushedAt.toIso8601String(),
        // "open_issues_count": openIssuesCount,
        // "license": license?.toJson(),
        // "allow_forking": allowForking,
        // "is_template": isTemplate,
        // "web_commit_signoff_required": webCommitSignoffRequired,
        // "topics": List<dynamic>.from(topics.map((x) => x)),
        // "forks": forks,
        // "open_issues": openIssues,
        // "watchers": watchers,
        "score": score,
      };
}

class License {
  String key;
  String name;
  String spdxId;
  String? url;
  String nodeId;

  License({
    required this.key,
    required this.name,
    required this.spdxId,
    required this.url,
    required this.nodeId,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
        key: json["key"],
        name: json["name"],
        spdxId: json["spdx_id"],
        url: json["url"],
        nodeId: json["node_id"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "spdx_id": spdxId,
        "url": url,
        "node_id": nodeId,
      };
}

class Owner {
  String login;
  int id;
  // String nodeId;
  String avatarUrl;
  // String gravatarId;
  String url;
  // String htmlUrl;
  // String followersUrl;
  // String followingUrl;
  // String gistsUrl;
  // String starredUrl;
  // String subscriptionsUrl;
  // String organizationsUrl;
  // String reposUrl;
  // String eventsUrl;
  // String receivedEventsUrl;
  // bool siteAdmin;

  Owner({
    required this.login,
    required this.id,
    // required this.nodeId,
    required this.avatarUrl,
    // required this.gravatarId,
    required this.url,
    // required this.htmlUrl,
    // required this.followersUrl,
    // required this.followingUrl,
    // required this.gistsUrl,
    // required this.starredUrl,
    // required this.subscriptionsUrl,
    // required this.organizationsUrl,
    // required this.reposUrl,
    // required this.eventsUrl,
    // required this.receivedEventsUrl,
    // required this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        id: json["id"],
        // nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        // gravatarId: json["gravatar_id"],
        url: json["url"],
        // htmlUrl: json["html_url"],
        // followersUrl: json["followers_url"],
        // followingUrl: json["following_url"],
        // gistsUrl: json["gists_url"],
        // starredUrl: json["starred_url"],
        // subscriptionsUrl: json["subscriptions_url"],
        // organizationsUrl: json["organizations_url"],
        // reposUrl: json["repos_url"],
        // eventsUrl: json["events_url"],
        // receivedEventsUrl: json["received_events_url"],
        // siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        // "node_id": nodeId,
        "avatar_url": avatarUrl,
        // "gravatar_id": gravatarId,
        "url": url,
        // "html_url": htmlUrl,
        // "followers_url": followersUrl,
        // "following_url": followingUrl,
        // "gists_url": gistsUrl,
        // "starred_url": starredUrl,
        // "subscriptions_url": subscriptionsUrl,
        // "organizations_url": organizationsUrl,
        // "repos_url": reposUrl,
        // "events_url": eventsUrl,
        // "received_events_url": receivedEventsUrl,
        // "site_admin": siteAdmin,
      };
}
