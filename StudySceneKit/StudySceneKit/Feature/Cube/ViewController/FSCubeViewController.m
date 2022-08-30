//
//  FSCubeViewController.m
//  StudySceneKit
//
//  Created by  View on 2022/8/30.
//

#import "FSCubeViewController.h"
#import <SceneKit/SceneKit.h>
#import <SceneKit/ModelIO.h>


@interface FSCubeViewController ()

@property (weak, nonatomic) IBOutlet SCNView *cubeScnView;
/// scene
@property (readwrite, nonatomic, strong) SCNScene *scene;

@end

@implementation FSCubeViewController




#pragma mark- Static变量


#pragma mark- 系统方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addStaticElement];
    [self fetchData];
    [self addDynamicElement];
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}


- (void)dealloc
{
    //解除题干内容的改变的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

#pragma mark- 初始化方法


- (void)addStaticElement
{
    
    _scene = [SCNScene scene];
    _cubeScnView.scene = _scene;
    _cubeScnView.backgroundColor = [UIColor grayColor];
    _cubeScnView.allowsCameraControl = YES;
    
    /// camera 摄像机
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    cameraNode.position = SCNVector3Make(0, 12, 50);
    cameraNode.rotation = SCNVector4Make(1, 0, 0, -sin(12/50));
    [_scene.rootNode addChildNode:cameraNode];
    
    [self loadCube];
    
}


- (void)addDynamicElement
{
    
    
}


- (void)setupElement
{
    
}


/** 数据 */
- (void)fetchData
{
    
    
}


#pragma mark- set方法



#pragma mark- 监听方法




#pragma mark- 代理方法 Delegate




#pragma mark- 辅助方法

- (void)loadCube {
    
    CGFloat cubeSide = 15;
    CGFloat halfSide = cubeSide/2.0;
    
    
    SCNVector3 cubeVertices[] = {
        SCNVector3Make(-halfSide, -halfSide,  halfSide),
        SCNVector3Make( halfSide, -halfSide,  halfSide),
        SCNVector3Make(-halfSide, -halfSide, -halfSide),
        SCNVector3Make( halfSide, -halfSide, -halfSide),
        SCNVector3Make(-halfSide,  halfSide,  halfSide),
        SCNVector3Make( halfSide,  halfSide,  halfSide),
        SCNVector3Make(-halfSide,  halfSide, -halfSide),
        SCNVector3Make( halfSide,  halfSide, -halfSide),
        
        // 重复
        SCNVector3Make(-halfSide, -halfSide,  halfSide),
        SCNVector3Make( halfSide, -halfSide,  halfSide),
        SCNVector3Make(-halfSide, -halfSide, -halfSide),
        SCNVector3Make( halfSide, -halfSide, -halfSide),
        SCNVector3Make(-halfSide,  halfSide,  halfSide),
        SCNVector3Make( halfSide,  halfSide,  halfSide),
        SCNVector3Make(-halfSide,  halfSide, -halfSide),
        SCNVector3Make( halfSide,  halfSide, -halfSide),
        
        // 重复
        SCNVector3Make(-halfSide, -halfSide,  halfSide),
        SCNVector3Make( halfSide, -halfSide,  halfSide),
        SCNVector3Make(-halfSide, -halfSide, -halfSide),
        SCNVector3Make( halfSide, -halfSide, -halfSide),
        SCNVector3Make(-halfSide,  halfSide,  halfSide),
        SCNVector3Make( halfSide,  halfSide,  halfSide),
        SCNVector3Make(-halfSide,  halfSide, -halfSide),
        SCNVector3Make( halfSide,  halfSide, -halfSide)
    };
    
    
    SCNVector3 cubeNormals[] = {
        // up and down
        SCNVector3Make( 0, -1, 0),
        SCNVector3Make( 0, -1, 0),
        SCNVector3Make( 0, -1, 0),
        SCNVector3Make( 0, -1, 0),
        
        SCNVector3Make( 0, 1, 0),
        SCNVector3Make( 0, 1, 0),
        SCNVector3Make( 0, 1, 0),
        SCNVector3Make( 0, 1, 0),
        
        // back and front
        SCNVector3Make( 0, 0,  1),
        SCNVector3Make( 0, 0,  1),
        SCNVector3Make( 0, 0, -1),
        SCNVector3Make( 0, 0, -1),
        
        SCNVector3Make( 0, 0, 1),
        SCNVector3Make( 0, 0, 1),
        SCNVector3Make( 0, 0, -1),
        SCNVector3Make( 0, 0, -1),
        
        // left and right
        SCNVector3Make(-1, 0, 0),
        SCNVector3Make( 1, 0, 0),
        SCNVector3Make(-1, 0, 0),
        SCNVector3Make( 1, 0, 0),
        
        SCNVector3Make(-1, 0, 0),
        SCNVector3Make( 1, 0, 0),
        SCNVector3Make(-1, 0, 0),
        SCNVector3Make( 1, 0, 0),
    };
    
    CGPoint cubeTexture[] = {
        CGPointMake(0, 0), // bottom
        CGPointMake(1, 0), // bottom
        CGPointMake(0, 1), // bottom
        CGPointMake(1, 1), // bottom
        
        CGPointMake(0, 1), // top
        CGPointMake(1, 1), // top
        CGPointMake(0, 0), // top
        CGPointMake(1, 0), // top
        
        CGPointMake(0, 1), // front
        CGPointMake(1, 1), // front
        CGPointMake(1, 1), // back
        CGPointMake(0, 1), // back
        
        CGPointMake(0, 0), // front
        CGPointMake(1, 0), // front
        CGPointMake(1, 0), // back
        CGPointMake(0, 0), // back
        
        CGPointMake(1, 1), // left
        CGPointMake(0, 1), // right
        CGPointMake(0, 1), // left
        CGPointMake(1, 1), // right
        
        CGPointMake(1, 0), // left
        CGPointMake(0, 0), // right
        CGPointMake(0, 0), // left
        CGPointMake(1, 0), // right
    };
    
    
    //六个面索引,共12个三角形的索引
    GLubyte cubeSolidIndexs[] = {
        // bottom
        0, 2, 1,
        1, 2, 3,
        // back
        10, 14, 11,  // 2, 6, 3,   + 8
        11, 14, 15,  // 3, 6, 7,   + 8
        // left
        16, 20, 18,  // 0, 4, 2,   + 16
        18, 20, 22,  // 2, 4, 6,   + 16
        // right
        17, 19, 21,  // 1, 3, 5,   + 16
        19, 23, 21,  // 3, 7, 5,   + 16
        // front
        8,  9, 12,  // 0, 1, 4,   + 8
        9, 13, 12,  // 1, 5, 4,   + 8
        // top
        4, 5, 6,
        5, 7, 6
    };
    
    GLubyte cubeLineIndexs[] = {
        // bottom
        0, 1,
        0, 2,
        1, 3,
        2, 3,
        // top
        4, 5,
        4, 6,
        5, 7,
        6, 7,
        // sides
        0, 4,
        1, 5,
        2, 6,
        3, 7,
        // diagonals
        0, 5,
        1, 7,
        2, 4,
        3, 6,
        1, 2,
        4, 7
    };
    
    
//    1.创建Source
//    2.创建Element
//    3.创建Geometry
//    4.设置Material
//    5.创建Node
    
    
    //创建自定义几何体对象
    // ----------------------------------
    //先创建各种source
    
    // 顶点
    SCNGeometrySource *vertexSource = [SCNGeometrySource geometrySourceWithVertices:cubeVertices count:24];
    // 法向量
    SCNGeometrySource *normalSource = [SCNGeometrySource geometrySourceWithNormals:cubeNormals count:24];
    // 纹理
    SCNGeometrySource *textureSource = [SCNGeometrySource geometrySourceWithTextureCoordinates:cubeTexture count:24];
    
    // 三角形 面
    // datawithbytes: 实际上是获取str在内存中的指针地址,length实际上是需要读写的长度.
    NSData *solidIndexdata = [NSData dataWithBytes:cubeSolidIndexs length:sizeof(cubeSolidIndexs)];
    SCNGeometryElement *solidElement = [SCNGeometryElement geometryElementWithData:solidIndexdata primitiveType:SCNGeometryPrimitiveTypeTriangles primitiveCount:12 bytesPerIndex:sizeof(GLubyte)];
    
    // 边线
    NSData *lineIndexdata = [NSData dataWithBytes:cubeLineIndexs length:sizeof(cubeLineIndexs)];
    SCNGeometryElement *lineElement = [SCNGeometryElement geometryElementWithData:lineIndexdata primitiveType:SCNGeometryPrimitiveTypeLine primitiveCount:18 bytesPerIndex:sizeof(GLubyte)];
    
    
    //创建几何体
    SCNGeometry *geometry = [SCNGeometry geometryWithSources:@[vertexSource, normalSource, textureSource] elements:@[solidElement, lineElement]];
    
    
    //设置材质,面/线
    SCNMaterial *solidMaterial = [SCNMaterial material];
    solidMaterial.diffuse.contents = [UIColor colorWithRed:4/255.0 green:120.0/255.0 blue:255.0/255.0 alpha:1.0];//[[UIColor orangeColor] colorWithAlphaComponent:0.3];
    solidMaterial.locksAmbientWithDiffuse = YES;
//    solidMaterial.doubleSided = YES;
    
    
    SCNMaterial *lineMaterial = [SCNMaterial material];
    lineMaterial.diffuse.contents = [UIColor whiteColor];
    lineMaterial.lightingModelName = SCNLightingModelConstant;
//    lineMaterial.doubleSided = YES;

    
    geometry.materials = @[solidMaterial,lineMaterial];

    
    
    SCNNode *node = [SCNNode nodeWithGeometry:geometry];
    [_cubeScnView.scene.rootNode addChildNode:node];
    
    
}





/// https://www.jianshu.com/p/a58462843ff2
- (void)loadSquare {
    
    //创建自定义几何体对象
    // ----------------------------------
    //先创建各种source
    
    
    SCNVector3 cubeVertices[] = {
        -1, -1, 1, // 0
        1, -1, 1, // 1
        1, 1, 1, //2
        -1, 1, 1,//3
    };
    
    SCNVector3 cubeVertices2[] = {
        SCNVector3Make(-1, -1, 1), // 0
        SCNVector3Make(1, -1, 1), // 1
        SCNVector3Make(1, 1, 1), //2
        SCNVector3Make(-1, 1, 1), //3
    };
    
    GLubyte cubeIndexs[] = {
        0, 1, 2,
        0, 2, 3
    };
    
    SCNVector3 cubeNormals[] = {
        0, 0, 1,
        0, 0, 1,
        0, 0, 1,
        0, 0, 1,
    };
    
    CGPoint cubeTexture[] = {
        0,1,
        1,1,
        1.0,
        0,0
    };
    
    
    // Vertices 三个分量向量的数组，每个分量向量表示几何体源的顶点位置。
    // count 顶点位置的数量。
    // https://developer.apple.com/documentation/scenekit/scngeometrysource/1523882-geometrysourcewithvertices
    SCNGeometrySource *vertexSource = [SCNGeometrySource geometrySourceWithVertices:cubeVertices count:4];
    SCNGeometrySource *normalSource = [SCNGeometrySource geometrySourceWithNormals:cubeNormals count:4];
    SCNGeometrySource *textureSource = [SCNGeometrySource geometrySourceWithTextureCoordinates:cubeTexture count:4];
    NSData *indexdata = [NSData dataWithBytes:cubeIndexs length:6];
    SCNGeometryElement *indexElement = [SCNGeometryElement geometryElementWithData:indexdata primitiveType:SCNGeometryPrimitiveTypeTriangles primitiveCount:6/3 bytesPerIndex:sizeof(GLubyte)];
    
    SCNGeometry *geometry = [SCNGeometry geometryWithSources:@[vertexSource, normalSource, textureSource] elements:@[indexElement]];
    geometry.firstMaterial.diffuse.contents = @[[UIColor orangeColor], [UIColor greenColor]];
    //
    geometry.firstMaterial.doubleSided = YES;
    
    SCNNode *node = [SCNNode nodeWithGeometry:geometry];
    [_cubeScnView.scene.rootNode addChildNode:node];

    
    
//    scnve\
    
}

- (SCNVector3)cubeVertices {
    return SCNVector3Make(-1, -1, 1);
}
//- (SCNVector3 [])cubeVertices {
//    return {
//        SCNVector3Make(-1, -1, 1), // 0
//        SCNVector3Make(1, -1, 1), // 1
//        SCNVector3Make(1, 1, 1), //2
//        SCNVector3Make(-1, 1, 1), //3
//    };
//}


#pragma mark- 其他方法




#pragma mark- 懒加载





/// 直接allow生成vc
+ (instancetype)viewController {
    return[[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}



@end
