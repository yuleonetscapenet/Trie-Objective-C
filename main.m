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
 * create a trie structure to store words
 * in this example, just three words: Test , test2, and test3
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
      
        // testing by inserting three words and search them
        NSString *word = @"Test";
        [rootNode insertWord:word node:rootNode];
        
        NSString *word2 =@"test2";
        [rootNode insertWord:word2 node:rootNode];

        NSString *word3 = @"test3";
        [rootNode insertWord:word3 node:rootNode];
        
        BOOL found=[rootNode searchWord:word note:rootNode];
        NSLog(@"%@, found=%d", word,found);
        
        found=[rootNode searchWord:word2 note:rootNode];
        NSLog(@"%@, found=%d", word2,found);

        found=[rootNode searchWord:word3 note:rootNode];
        NSLog(@"%@, found=%d", word3,found);
        
        //this is a fail case of searching the word 'tesla'; should return a 0
        found=[rootNode searchWord:@"tesla" note:rootNode];
        NSLog(@"%@, found=%d", @"tesla",found);
        
    }
    return 0;
}

