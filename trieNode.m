//
//  trieNode.m
//  HypnoTime
//
//  Created by leo yu on 4/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "trieNode.h"


@implementation trieNode

@synthesize branches = mBranches, fullWord = fullWord, mc = mMc ; //  ,neighbors = mNeighbors; //  ,  alphabets = mAlphabets, nArray = mNarray ; //title

-(id) initWithChar:(char)c
{
    self = [ super init ] ;
    if ( self )
    {
        //create 20 nodes
        mBranches = [[ NSMutableDictionary alloc ] initWithCapacity:20] ;
        mMc=c;
    }

    return self;
}



-(id) init
{
    self = [ super init ] ;
    if ( self )
    {
        //create 20 nodes
        mBranches = [[ NSMutableDictionary alloc ] initWithCapacity:20];
       
    }
    return self;
}



-(void) setMc:(char)c 
{
    mMc = c;
}

-(char) getMc
{
    return mMc;
}

-(BOOL) getFullWord
{
    return fullWord;
}

-(void) setFullWord:(BOOL) t
{
    fullWord = t;
}


-(void)dealloc
{
 
}

@end
