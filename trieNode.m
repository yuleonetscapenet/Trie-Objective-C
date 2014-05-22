//
//  trieNode.m
//
//  Created by leo yu on 4/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "trieNode.h"


@implementation trieNode

@synthesize branches = mBranches, pFullWord = mFullWord, pCharInWord = mCharInWord ;

/*
 * init node with a character
 */
-(id) initWithChar:(char)c
{
    self = [ super init ] ;
    if ( self )
    {
        //create 20 nodes
        mBranches = [[ NSMutableDictionary alloc ] initWithCapacity:20] ;
        self.pCharInWord=c;
    }

    return self;
}


/*
 * init method without a character
 */
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


/*
 * getter method for boolean variable fullword indicating this is a word
 */
-(BOOL) getFullWord
{
    return self.pFullWord;
}


/*
 * setter method for boolean variable fullword indicating this is a word
 */
-(void) setFullWord:(BOOL) t
{
    self.pFullWord = t;
}


/*
 * search a word in a trie structure
 */
-(BOOL) searchWord:(NSString*) word  note:(trieNode*) rootNode
{
    BOOL exists = NO;
    
    NSMutableDictionary *branches = rootNode.branches;
    
    NSInteger wordLen = [word length ];
    
   //for each character in a word, traverse the node chain from branches of root node
    for ( int i=0; i<wordLen; i++ )
    {
        char c = [word characterAtIndex: i];
        trieNode *branch = [branches objectForKey:[NSString stringWithFormat:@"%c", c] ];
        
        if ( branch )
        {
            branches = [ branch branches ];
            
            // last letter
            if ( i == (wordLen-1) )
            {
                exists=true;
            }
        }
    }   //for
    
    return exists;
}


/*
 * insert a word into a trie stucture
 */
-(void) insertWord:(NSString *)word  node:(trieNode *) rootNode
{
    NSMutableDictionary *branches = rootNode.branches;
    NSInteger wordLength = [word length];
    
    //for each character in a word, traverse the node chain from branches of root node
    for ( NSInteger i=0; i<wordLength; i++)
    {
        char c = [word characterAtIndex:i];
        
        //see if a branch in this node's branches contains this character
        trieNode *branch = [branches  objectForKey: [NSString stringWithFormat:@"%c", c] ];
        
        //if not create a trieNode as a branch
        if (!branch)
        {
            branch = [[trieNode alloc]initWithChar:c];
            
            //set this node one of the branches
            [branches setObject:branch  forKey:[NSString stringWithFormat:@"%c", c]];
            
            //if this is the last letter in the word
            if ( i == (wordLength -1 )  )
            {
                [branch setFullWord: YES ];
            }
            else
            {
                //branches becomes the current branches to traverse down the node chain
                branches = [branch branches];
            }
            branch = nil;
        }
        else
        {
            //branch becomes the current branch to traverse down the node chain
            branches = [branch branches];
        }
    }   //for
}

@end
