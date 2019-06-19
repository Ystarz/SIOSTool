
#import "UITextView+Placeholder.h"
#import "SSystemDefine.h"

@implementation UITextView (Placeholder)

-(void)setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor
{
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = placeholdStr;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = placeholdColor;
    placeHolderLabel.font = self.font;
    [placeHolderLabel sizeToFit];
    
    /*
     [self setValue:(nullable id) forKey:(nonnull NSString *)]
     ps: KVC键值编码，对UITextView的私有属性进行修改
     */
    if (SYS_VERSION >= 8.3) {
        UILabel *placeholder = [self valueForKey:@"_placeholderLabel"];
        //防止重复
        if (placeholder) {
            return;
        }
        [self addSubview:placeHolderLabel];
        [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    }
}

@end


////方法的实现部分（记得导入头文件"UITextView+Placeholder.h"）
//UITextView *contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 300, 300, 60)];
//contentTextView.layer.cornerRadius = 6;
//contentTextView.layer.borderWidth = 0.6;
//contentTextView.layer.borderColor = [UIColor grayColor].CGColor;
//contentTextView.layer.masksToBounds = YES;
//contentTextView.font = [UIFont systemFontOfSize:13];
////调用私有方法
//[contentTextView setPlaceholder:@"这是placeholder文字..." placeholdColor:[UIColor lightGrayColor]];
//[self.view addSubview:contentTextView];

