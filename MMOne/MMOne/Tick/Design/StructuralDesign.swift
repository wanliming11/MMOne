//
// Created by Murloc Wan on 2023/3/14.
// 结构型设计模式：
// 代理模式

import Foundation
// MARK: - 代理模式: 为其他对象提供一种代理以控制对这个对象的访问，权限控制与大开销的控制
/// 在日常生活中：包括 VPN 也会经常使用远程代理，所有网络请求都会经过 VPN 代理后发出和接收。

protocol ControlProtocol {
    func connect()
    func disConnect()
}

/// 原生对象
class Control: ControlProtocol {
    func connect() {
        print("connect")
    }

    func disConnect() {
        print("disConnect")
    }
}

/// 代理对象
class ControlProxy: ControlProtocol {
    var control: ControlProtocol
    init(control: ControlProtocol) {
        self.control = control
    }

    func connect() {
        control.connect()
    }

    func disConnect() {
        control.disConnect()
    }
}

// MARK: - 装饰器模式
/// 装饰器模式：动态地给一个对象添加一些额外的职责，就增加功能来说，装饰器模式比生成子类更为灵活。
/// 可以结合音频直播间的装扮体系来理解装饰器模式，比如：头像框、勋章、VIP 等等。

/// 装饰器协议
protocol DecoratorProtocol {
    func show()
}

/// 原始对象
class Decorator: DecoratorProtocol {
    func show() {
        print("原始对象")
    }
}

/// 头像框装饰器
class HeadFrameDecorator: DecoratorProtocol {
    var decorator: DecoratorProtocol
    init(decorator: DecoratorProtocol) {
        self.decorator = decorator
    }

    func show() {
        decorator.show()
        print("装饰器头像框")
    }
}

/// 勋章装饰器
class VIPDecorator: DecoratorProtocol {
    var decorator: DecoratorProtocol
    init(decorator: DecoratorProtocol) {
        self.decorator = decorator
    }

    func show() {
        decorator.show()
        print("装饰器VIP")
    }
}

// MARK: - 适配器模式
/// 适配器模式：将一个类的接口转换成客户希望的另一个接口，适配器模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作。
/// 适配器模式的应用场景：比如：我们在开发中经常会遇到这样的情况，我们需要使用第三方的 SDK，但是第三方的 SDK 并不是我们想要的接口，这时候我们就可以使用适配器模式来适配第三方的 SDK。
/// 1. 原始形态
protocol OriginProtocol {
    func origin()
}

class Origin: OriginProtocol {
    func origin() {
        print("原始功能")
    }
}

protocol  TargetProtocol {
    func target()
}

class Target: TargetProtocol {
    func target() {
        print("目标功能")
    }
}

protocol AdapterProtocol: TargetProtocol {
    var origin: OriginProtocol { get }
    init(origin: OriginProtocol)
}

class Adapter: AdapterProtocol {
    var origin: OriginProtocol
    required init(origin: OriginProtocol) {
        self.origin = origin
    }

    func target() {
        origin.origin()
    }
}

// MARK: - 桥接模式
/// 桥接模式：将抽象部分与它的实现部分分离，使它们都可以独立地变化。
/// 桥接模式的应用场景：比如：我们在开发中经常会遇到这样的情况，我们需要使用第三方的 SDK，但是第三方的 SDK 并不是我们想要的接口，这时候我们就可以使用适配器模式来适配第三方的 SDK。
protocol HistoryProtocol {
    func doSomething()
}

class History: HistoryProtocol {
    func doSomething() {
        print("历史功能")
    }
}

protocol HistoryBridge {
    func bridgeImplementor(history: HistoryProtocol)
}

class BridgeImplementor: HistoryBridge {
    func bridgeImplementor(history: HistoryProtocol) {
        history.doSomething()
    }
}

// MARK: - 组合模式
/// 组合模式：将对象组合成树形结构以表示“部分-整体”的层次结构，组合模式使得用户对单个对象和组合对象的使用具有一致性。
/// 叶子功能, 限定是类对象
protocol Component: AnyObject {
    func operation()
}

class Leaf: Component {
    func operation() {
        print("叶子功能")
    }
}

/// 组合模式协议
protocol Composite: Component {
    func add(component: Component)
    func remove(component: Component)
}

/// 树枝功能
class Branch: Composite {
    var components = [Component]()

    func add(component: Component) {
        components.append(component)
    }

    func remove(component: Component) {
        if let index = components.firstIndex(where: { $0 === component }) {
            components.remove(at: index)
        }
    }

    func operation() {
        print("树枝功能")
        for item in components {
            item.operation()
        }
    }
}

// MARK: - 享元模式
/// 享元模式：运用共享技术有效地支持大量细粒度的对象。

/// 享元模式协议
protocol FlyweightProtocol {
    func operation()
}

/// 具体享元
class ConcreteFlyweight: FlyweightProtocol {
    var intrinsicState: String
    init(intrinsicState: String) {
        self.intrinsicState = intrinsicState
    }

    func operation() {
        print("具体享元")
    }
}

/// 享元工厂，用来缓存和复用可以共享的内存
class FlyweightFactory {
    var flyweights = [String: FlyweightProtocol]()

    func getFlyweight(key: String) -> FlyweightProtocol {
        if let flyweight = flyweights[key] {
            return flyweight
        } else {
            let flyweight = ConcreteFlyweight(intrinsicState: key)
            flyweights[key] = flyweight
            return flyweight
        }
    }
}

class StructuralDesignTest: NSObject {
    override init() {
        super.init()

        testProxy()
    }

    /// 1. 测试代理模式
    func testProxy() {
        let control = Control()
        let proxy = ControlProxy(control: control)
        proxy.connect()
        proxy.disConnect()
    }

    /// 2. 测试装饰器模式
    func testDecorator() {
        let decorator = Decorator()
        let decoratorA = HeadFrameDecorator(decorator: decorator)
        let decoratorB = VIPDecorator(decorator: decoratorA)  /// 多层装饰
        decoratorB.show()
    }

    /// 3. 测试适配器模式
    func testAdapter() {
        let origin = Origin()
        let adapter = Adapter(origin: origin)
        adapter.target()
    }

    /// 4. 测试桥接模式
    func testBridge() {
        let history = History()
        let bridge = BridgeImplementor()
        /// 并不直接依赖 History ，而是通过依赖协议，可以实现局部功能的替换
        bridge.bridgeImplementor(history: history)
    }

    /// 5. 测试组合模式
    func testComposite() {
        let branch = Branch()
        let leaf = Leaf()
        branch.add(component: leaf)
        branch.operation()
    }

    // 6. 测试享元模式
    func testFlyweight() {
        let factory = FlyweightFactory()
        let flyweightA = factory.getFlyweight(key: "A")
        let flyweightB = factory.getFlyweight(key: "B")
        let flyweightC = factory.getFlyweight(key: "C")
        let flyweightD = factory.getFlyweight(key: "D")
        let flyweightE = factory.getFlyweight(key: "E")
        let flyweightF = factory.getFlyweight(key: "F")
        let flyweightG = factory.getFlyweight(key: "G")
        let flyweightH = factory.getFlyweight(key: "H")
        let flyweightI = factory.getFlyweight(key: "I")
        let flyweightJ = factory.getFlyweight(key: "J")
        let flyweightK = factory.getFlyweight(key: "K")
        let flyweightL = factory.getFlyweight(key: "L")
        let flyweightM = factory.getFlyweight(key: "M")
        let flyweightN = factory.getFlyweight(key: "N")
        let flyweightO = factory.getFlyweight(key: "O")
        let flyweightP = factory.getFlyweight(key: "P")
        let flyweightQ = factory.getFlyweight(key: "Q")
        let flyweightR = factory.getFlyweight(key: "R")
        let flyweightS = factory.getFlyweight(key: "S")
        let flyweightT = factory.getFlyweight(key: "T")
        let flyweightU = factory.getFlyweight(key: "U")
        let flyweightV = factory.getFlyweight(key: "V")
        let flyweightW = factory.getFlyweight(key: "W")
        let flyweightX = factory.getFlyweight(key: "X")
        let flyweightY = factory.getFlyweight(key: "Y")
        let flyweightZ = factory.getFlyweight(key: "Z")
        flyweightA.operation()
        flyweightB.operation()
        flyweightC.operation()
        flyweightD.operation()
        flyweightE.operation()
        flyweightF.operation()
        flyweightG.operation()
        flyweightH.operation()
        flyweightI.operation()
        flyweightJ.operation()
        flyweightK.operation()
        flyweightL.operation()
        flyweightM.operation()
        flyweightN.operation()
    }
}
