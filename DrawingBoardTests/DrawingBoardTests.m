//
//  DrawingBoardTests.m
//  DrawingBoardTests
//
//  Created by Admin on 12/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DBSimpleRegularPolygon.h"

@interface DrawingBoardTests : XCTestCase

@end

@implementation DrawingBoardTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testPolygonSidesForOneSide {
    NSError *error;
    DBSimpleRegularPolygon *polygon = [[DBSimpleRegularPolygon alloc]init];
    [polygon setSides:1 error:&error];
    XCTAssertNotNil(error);
}

-(void)testPolygonSidesForFourSide {
    NSError *error;
    DBSimpleRegularPolygon *polygon = [[DBSimpleRegularPolygon alloc]init];
    [polygon setSides:4 error:&error];
    XCTAssertNil(error);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
