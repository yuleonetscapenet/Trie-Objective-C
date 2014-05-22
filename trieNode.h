//
//  trieNode.h
//
//  Created by leo yu on 4/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface trieNode : NSObject
{
    char mCharInWord;
    NSMutableDictionary *mBranches;
    BOOL mFullWord;
}

//a node has at most 26 branches 'a' thru 'z'
@property (retain, nonatomic) NSMutableDictionary *branches;

//indicates a full word
@property (nonatomic) BOOL pFullWord;
@property ( nonatomic) char pCharInWord;

-(BOOL) getFullWord;
-(void) setFullWord:(BOOL)t;
-(id) initWithChar:(char)c;

-(BOOL) searchWord:(NSString*) word  note:(trieNode*) rootNode;
-(void) insertWord:(NSString *)word  node:(trieNode *) rootNode;
@end
