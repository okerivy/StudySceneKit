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
