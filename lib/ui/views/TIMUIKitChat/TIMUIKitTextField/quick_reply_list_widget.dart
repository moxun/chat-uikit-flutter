import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/theme/color.dart';

import '../../../../base_widgets/tim_ui_kit_base.dart';
import '../../../../base_widgets/tim_ui_kit_state.dart';

class QuickReplyListWidget extends StatefulWidget {
  final List<String> quickReplyList;
  final Function(String) onQuickReplyClick;

  const QuickReplyListWidget({super.key, required this.quickReplyList, required this.onQuickReplyClick});

  @override
  State<QuickReplyListWidget> createState() => _QuickReplyListWidgetState();
}

class _QuickReplyListWidgetState extends TIMUIKitState<QuickReplyListWidget> {
  @override
  Widget tuiBuild(BuildContext context, TUIKitBuildValue value) {
    return Container(
      height: 290,
      child: ListView.builder(itemBuilder: (context, index) {
        return quickReplyItem(widget.quickReplyList[index]);
      }),
    );
  }

  Widget quickReplyItem(String quickReply) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 62,
        child: Row(
          children: [
            Expanded(
                child: Text(
              quickReply,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
            GestureDetector(
              onTap: () {
                widget.onQuickReplyClick(quickReply);
              },
              child: Container(
                width: 50,
                height: 26,
                decoration: BoxDecoration(
                  color: hexToColor("FEF854"),
                  borderRadius: BorderRadius.circular(18),
                ),
                alignment: Alignment.center,
                child: Text(
                  "发送",
                  style: TextStyle(fontSize: 14, color: hexToColor("ffffff")),
                ),
              ),
            )
          ],
        ));
  }
}
