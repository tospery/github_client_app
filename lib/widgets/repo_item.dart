
import 'package:flutter/material.dart';
import 'package:github_client_app/widgets/utils.dart';

import '../common/my_icons.dart';
import '../l10n/localizations.dart';
import '../models/index.dart';

class RepoItem extends StatefulWidget {
  // 将`repo.id`作为RepoItem的默认key,在下一次build时复用旧的widget
  RepoItem(this.repo) : super(key: ValueKey(repo.id));

  final Repo repo;

  @override
  State<StatefulWidget> createState() {
    return _RepoItemState();
  }
}

class _RepoItemState extends State<RepoItem> {
  @override
  Widget build(BuildContext context) {
    var subtitle = const Text("");

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        color: Colors.white,
        shape: BorderDirectional(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                dense: true,
                leading: gmAvatar(
                  //项目owner头像
                  widget.repo.owner.avatar,
                  width: 24.0,
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Text(
                  widget.repo.owner.login,
                  textScaleFactor: .9,
                ),
                subtitle: subtitle,
                trailing: Text(widget.repo.language ?? ""),
              ),
              // 构建项目标题和简介
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.repo.fork
                          ? widget.repo.fullName
                          : widget.repo.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: widget.repo.fork
                            ? FontStyle.italic //文字样式，斜体
                            : FontStyle.normal,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 12),
                        child: widget.repo.description == null
                            ? Text(
                                APPLocalizations.of(context).noDescription,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[700],
                                ),
                              )
                            : Text(
                                widget.repo.description,
                                maxLines: 3,
                                style: TextStyle(
                                  height: 1.15,
                                  color: Colors.blueGrey[700],
                                  fontSize: 13,
                                ),
                              ))
                  ],
                ),
              ),
              //构建卡片底部
              _buildBottom(),
            ],
          ),
        ),
      ),
    );
  }

  /**
   * 卡片底部
   */
  _buildBottom() {
    const paddingWidth = 10;
    return IconTheme(
      data: IconThemeData(
        color: Colors.grey,
        size: 15,
      ),
      child: DefaultTextStyle(
          style: TextStyle(color: Colors.grey, fontSize: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Builder(builder: (context) {
              var children = <Widget>[
                Icon(Icons.star),
                Text(" " +
                    widget.repo.stargazersCount
                        .toString()
                        .padRight(paddingWidth)),
                Icon(Icons.info_outline),
                Text(" " +
                    widget.repo.openIssuesCount
                        .toString()
                        .padRight(paddingWidth)),
                Icon(MyIcons.fork), //我们的自定义图标
                Text(" " +
                    widget.repo.forksCount.toString().padRight(paddingWidth)),
              ];

              if (widget.repo.fork) {
                children.add(Text("Forked".padRight(paddingWidth)));
              }

              if (widget.repo.private == true) {
                children.addAll(<Widget>[
                  Icon(Icons.lock),
                  Text(" private".padRight(paddingWidth))
                ]);
              }
              return Row(
                children: children,
              );
            }),
          )),
    );
  }
}