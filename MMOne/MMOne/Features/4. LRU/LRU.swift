import Foundation

class LRU {
    class Node {
        var key: Int
        var val: Int
        var next: Node?
        weak var prev: Node?

        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
    }

    /// 双链表属性
    /// 虚拟头和尾节点，用来解决边界问题，避免出错
    var vHead: Node? = Node(0, 0)
    var vTail: Node? = Node(0, 0)
    var size: Int = 0
    /// 容量
    var capacity: Int

    var map: [Int: Node] = [:]

    init(_ capacity: Int) {
        self.capacity = capacity
        self.vHead?.next = vTail
        self.vTail?.prev = vHead
    }

    // MARK: 双链表基础操作
    /// 1. 添加节点到头部
    func addHeadLinkNode(_ node: Node) {
        node.next = vHead?.next
        node.prev = vHead
        vHead?.next?.prev = node
        vHead?.next = node
    }

    /// 2. 添加节点到尾部
    func addTailLinkNode(_ node: Node) {
        let prev = vTail?.prev
        prev?.next = node
        node.prev = prev
        node.next = vTail
        vTail?.prev = node
    }

    /// 3. 移除节点
    func removeLinkNode(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    /// 4.
    func moveNodeToHead(_ node: Node) {
        removeLinkNode(node)
        addHeadLinkNode(node)
    }

    // MARK: 复合操作，字典和双链表一起, 增加和删除操作一体
    func addNode(_ key: Int, node: Node) {
        addHeadLinkNode(node)
        map[key] = node
        size += 1
    }

    func cleanIfExceeded() {
        if size > capacity {
            if let tail = vTail?.prev, tail !== vHead {
                removeLinkNode(tail)
                map[tail.key] = nil
                size -= 1
            }
        }
    }

    // MARK: Output
    func get(_ key: Int) -> Int {
        if let value = map[key] {
            moveNodeToHead(value)
            return value.val
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        /// If existed, update and moveNodeToHead
        if let keyValue = map[key] {
            moveNodeToHead(keyValue)
            keyValue.val = value
        } else {
            addNode(key, node: Node(key, value))
            cleanIfExceeded()
        }
    }

}
