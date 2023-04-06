import 'package:flutter/material.dart';

class AlertComponent {
  deleteAlert(BuildContext context, {VoidCallback? onDelete}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(
                  'assets/delete.png',
                  width: 167,
                  height: 167,
                ),
              ),
              const Center(
                child: Text(
                  'Hapus Data?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF122F35),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text(
                  'Apakah anda yakin bahwa anda ingin menghapus data ini ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF929292),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.only(left: 17, right: 17, bottom: 17),
        actions: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Center(
                    child: Text(
                      'Batal',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF122F35),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Center(
                      child: Text(
                        'Hapus',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
