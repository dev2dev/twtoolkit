//
//  TWCollectionViewItem.h
//  TWToolkit
//
//  Created by Sam Soffes on 6/11/10.
//  Copyright 2010 Tasteful Works. All rights reserved.
//

typedef enum {
    TWCollectionViewItemStyleDefault = UITableViewCellStyleDefault,
    TWCollectionViewItemStyleSubtitle = UITableViewCellStyleSubtitle,
    TWCollectionViewItemStyleBlank
} TWCollectionViewItemStyle;

//typedef enum {
//    TWCollectionViewItemSelectionStyleNone = UITableViewCellSelectionStyleNone,
//    TWCollectionViewItemSelectionStyleBlue = UITableViewCellSelectionStyleBlue,
//    TWCollectionViewItemSelectionStyleGray = UITableViewCellSelectionStyleGray
//} TWCollectionViewItemSelectionStyle;

typedef enum {
    TWCollectionViewItemEditingStyleNone = UITableViewCellEditingStyleNone,
    TWCollectionViewItemEditingStyleDelete = UITableViewCellEditingStyleDelete,
    TWCollectionViewItemEditingStyleInsert = UITableViewCellEditingStyleInsert
} TWCollectionViewItemEditingStyle;


@interface TWCollectionViewItem : UIView {

	TWCollectionViewItemStyle _style;
	
	NSString *_reuseIdentifier;
    UIView *_contentView;
	UILabel *_textLabel;
	UILabel *_detailTextLabel;
    UIView *_backgroundView;
    UIView *_selectedBackgroundView;
	
	BOOL _selected;
	BOOL _highlighted;
}

- (id)initWithStyle:(TWCollectionViewItemStyle)style reuseIdentifier:(NSString *)aReuseIdentifier;

@property (nonatomic, readonly, retain) UIImageView *imageView;
@property (nonatomic, readonly, retain) UILabel *textLabel;
@property (nonatomic, readonly, retain) UILabel *detailTextLabel;

@property (nonatomic, retain) UIView *backgroundView;
@property (nonatomic, retain) UIView *selectedBackgroundView;

@property (nonatomic, readonly, copy) NSString *reuseIdentifier;

@property (nonatomic) UITableViewCellSelectionStyle selectionStyle;
@property (nonatomic, getter=isSelected) BOOL selected;
@property (nonatomic, getter=isHighlighted) BOOL highlighted;


- (void)prepareForReuse; 

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;

@end
