//
//  main.m
//  Trie
//
//  Created by Leo Yu on 5/17/14.
//  Copyright (c) 2014 Leo Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "trieNode.h"

/*
 * search a word in a trie structure
 */
bool searchWord( NSString* word, trieNode *rootNode)
{
    bool exists = NO;
    
    NSMutableDictionary *branches = rootNode.branches;
    
    NSInteger wordLen = [word length ];
    
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
                return( [branch getFullWord] ) ;
            }   //if
        }   //if
        else
        {   //not found
            return exists;
        }
    }   //for
    
    return exists;

}


/*
 * insert a word into a trie stucture
 */
void insertWord( NSString *word, trieNode *rootNode)
{

    NSMutableDictionary *branches = rootNode.branches;
    NSInteger wordLength = [word length];
    
    for ( NSInteger i=0; i<wordLength; i++)
    {
        char c = [word characterAtIndex:i];
        
        trieNode *branch = [branches  objectForKey: [NSString stringWithFormat:@"%c", c] ];
        
        if (!branch)
        {
            branch = [[trieNode alloc]initWithChar:c];
            
            [branches setObject:branch  forKey:[NSString stringWithFormat:@"%c", c]];
            
            //if this is the last letter in the word
            if ( i == (wordLength -1 )  )
            {
                [branch setFullWord: YES ];
            }
            else
            {
                //branch becomes the current branch
                branches = [branch branches];
            }
            branch = nil;
        }
        else
        {
            //branch becomes the current branch
            branches = [branch branches];
            
        }
        
    }   //for
    
}


/*
 * create a trie structure to store words
 * in this example, just two words: Test , test2
 *
 * refer to the wiki page of how words are stored: http://en.wikipedia.org/wiki/Trie
 *
 */
int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        //initialize root node of trieNode
        trieNode *rootNode = [[trieNode alloc]init];
      
        NSString *word = @"Test";
        insertWord(word, rootNode);
        
        NSString *word2 =@"test2";
        insertWord(word2, rootNode);
        
        bool found=searchWord(word, rootNode);
        NSLog(@"%@, found=%d", word,found);
        
        found=searchWord(word2, rootNode);
        NSLog(@"%@, found=%d", word2,found);
        
        NSString *word3 = @"test3";
        found = searchWord(word3, rootNode);
        NSLog(@"%@, found=%d", word3,found);
 
    }
    return 0;
}

