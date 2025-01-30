import 'package:flutter/material.dart';

import '../service/chat_service.dart';

class Message {
  void optionsMenuOne(BuildContext context, String messageId, String userId) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.report, color: Colors.blue),
                title: Text("Report"),
                onTap: () {
                  Navigator.pop(context);
                  reportMessage(context, messageId, userId);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.block, color: Colors.green),
                title: Text("Block"),
                onTap: () {
                  Navigator.pop(context);
                  blockUser(context, userId);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.cancel, color: Colors.red),
                title: Text("Cancel"),
                onTap: () {
                  Navigator.pop(context);
                  // Add your delete functionality here
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void optionsMenuTwo(BuildContext context, String messageId, String userId) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blue),
                title: Text("Edit"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.green),
                title: Text("Delete"),
                onTap: () {
                  Navigator.pop(context);
                  blockUser(context, userId);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.cancel, color: Colors.red),
                title: Text("Cancel"),
                onTap: () {
                  Navigator.pop(context);
                  // Add your delete functionality here
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void blockUser(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Block User"),
          content: Text("Are you sure you want to block this user?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close dialog
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pop(); // Close confirmation dialog
                _showProcessingDialog(context);

                // Call the blockUser method from ChatService
                ChatService().blockUser(userId).then((_) {
                  Navigator.pop(context); // Close processing dialog
                  _showResultDialogBlock(context, success: true);
                }).catchError((error) {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // Close processing dialog
                  _showResultDialogBlock(context, success: false);
                });
              },
              child: Text("Block", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void reportMessage(BuildContext context, String messageId, String userId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Report Message"),
          content: Text("Are you sure you want to report this message?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close dialog
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close confirmation dialog
                _showProcessingDialog(context);

                // Simulate reporting process (e.g., sending to Firestore)

                ChatService().reportUser(messageId, userId).then((_) {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // Close processing dialog
                  _showResultDialogReport(context, success: true);
                }).catchError((error) {
                  Navigator.of(context, rootNavigator: true).pop();
                  _showResultDialogReport(context, success: false);
                });
              },
              child: Text("Report", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

// Show a loading dialog while reporting
  void _showProcessingDialog(BuildContext context) {
    showDialog(
      context: context,
      // barrierDismissible: false, // Prevent user from dismissing manually
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Processing..."),
            ],
          ),
        );
      },
    );

    // Automatically close the dialog after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    });
  }

  // Show success or failure message
  void _showResultDialogBlock(BuildContext context, {required bool success}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(success ? "User Blocked" : "Block Failed"),
          content: Text(success
              ? "This user has been blocked successfully."
              : "Something went wrong. Please try again."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

// Show success or failure message
  void _showResultDialogReport(BuildContext context, {required bool success}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(success ? "Report Submitted" : "Report Failed"),
          content: Text(success
              ? "Thank you for reporting. Our team will review the message."
              : "Something went wrong. Please try again."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
