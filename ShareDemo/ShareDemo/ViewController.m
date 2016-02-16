//
//  ViewController.m
//  ShareDemo
//
//  Created by Ganesh, Ashwin on 2/16/16.
//  Copyright © 2016 Ashwin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,retain) UIDocumentInteractionController *documentInteractionController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)previewDocument:(id)sender {
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"pdf"];
    
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        
        // Preview PDF
        [self.documentInteractionController presentPreviewAnimated:YES];
    }
}

- (IBAction)openDocument:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"pdf"];
    
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        
        // Present Open In Menu
        [self.documentInteractionController presentOpenInMenuFromRect:[button frame] inView:self.view animated:YES];
    }
}

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}

- (void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller{
    NSLog(@"Share dismissed");
}
@end
