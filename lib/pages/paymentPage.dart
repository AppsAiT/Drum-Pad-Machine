import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(
        'Payment Success : ${response.paymentId}, ${response.orderId}, ${response.signature}');

    // Show success dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Success'),
          content: Text(
              'Payment has been successfully completed. Payment ID: ${response.paymentId}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );

    _razorpay.clear();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error : ${response.code} --> ${response.message}');

    // Show failure dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Failure'),
          content: Text(
              'Payment has failed to complete. Error: ${response.message}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );

    _razorpay.clear();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet : ${response.walletName}');

    // Show failure dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('External Wallet'),
          content: Text('External Wallet: ${response.walletName}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );

    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
              onPressed: () {
                const total = 100;
                const name = 'Test';
                const description = 'Demo Payment';
                var options = {
                  'key': 'rzp_test_MYuwgd89Hh4FwO',
                  'amount': total * 100,
                  'name': name,
                  'description': description,
                  'prefill': {
                    'contact': '8309365005',
                    'email': 'vikram.nitpy@gmail.com'
                  }
                };

                try {
                  _razorpay.open(options);
                } catch (error) {
                  print('====================> Error : $error');
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                backgroundColor: Colors.amberAccent,
              ),
              child: const Text(
                "Make Payment",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              )),
        ),
      ),
    );
  }
}
