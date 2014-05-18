//
//  trieNode.h
//  HypnoTime
//
//  Created by leo yu on 4/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface trieNode : NSObject
{
    char mMc ;
    NSMutableDictionary *mBranches;
    BOOL fullWord;
}

//a node has at most 26 branches 'a' thru 'z'
@property (retain, nonatomic) NSMutableDictionary *branches;

//indicates a full word
@property (nonatomic) BOOL fullWord;

@property ( nonatomic) char mc;



-(void) setMc:(char)c ;
-(char) getMc;
-(void) setFullWord:(BOOL)t;
-(BOOL) getFullWord;
-(id) initWithChar:(char)c;

@end
