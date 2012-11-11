UCFeedback
==========

An easy-to-use iOS Feedback class.

What is it?
-----------

UCFeedback is a simple generic class which you can use your any kind of iOS projects easily.
It simply creates a `Feedback` button with your parameters and add it to your desired View Controller.

When user taps on the button, it takes a screenshot of your application's current state and sends it to your email address.

You can use `UCFeedback` to get feedbacks from your iOS application with a nice screenshot.

The class is fully documented and configurable as much as you want.


Installation
------------

* Copy the `UCFeedback.h` and `UCFeedback.m` files to your application
* Add `QuartzCore.framework` to take the screenshots properly
* Add `MessageUI.framework` to send emails properly

Then you're ready to send feedbacks inside your apps with a nice screenshot!


Usage
-----

* Add `#import "UCFeedback.h"` to your View Controller's header file
* Add `<UCFeedbackDelegate>` to same file
* Add the following code to your implementation file (maybe in `viewDidLoad` method) with your parameters in it

``` objective-c
UCFeedback *feedback = [[UCFeedback alloc] initWithFrame:CGRectMake(110, 150, 100, 50) andTitle:@"Feedback" andButtonType:UIButtonTypeRoundedRect];
feedback.delegate = self;
[self.view addSubview:feedback];
```
* You check out the example project to see how I did it
* Enjoy!


Credits
-------

UCFeedback is created by [Ulas Can Cengiz](http://ulas.co)([ulsc](https://github.com/ulsc/) on github).

You can;
send me an [e-mail](mailto:ulas@ulas.co),
follow me on [Twitter](https://twitter.com/ulsc),
find me on [Facebook](http://facebook.com/ulascancengiz), or
connect me on [LinkedIn](http://linkedin.com/in/ulascengiz)


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_markup`)
3. Commit your changes (`git commit -am "Hey look! I'm Contributing!"`)
4. Push to the branch (`git push origin my_markup`)
5. Open a [Pull Request][1]
6. Enjoy a refreshing Diet Coke and wait
