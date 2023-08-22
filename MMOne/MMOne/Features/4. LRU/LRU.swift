//
//  LRU.swift
//  MMOne
//
//  Created by kevin wan on 2023/8/18.
//

import Foundation

class DoubleLinkedList {
    /// node has next and pre.
    class Node {
        var key: Int   /// 存在 key 的目的，是为了能反向通过 node 找到 key ，清除 map
        var val: Int
        var next: Node?
        weak var pre: Node?

        init(key: Int, val: Int, next: Node? = nil, pre: Node? = nil) {
            self.key = key
            self.val = val
            self.next = next
            self.pre = pre
        }
    }

    var _head: Node?
    var _tail: Node?
    var _nodeMap: [Int: Node] = [:]
    var _size: Int = 0
    var _maxSize: Int

    init(head: Node? = nil, tail: Node? = nil, maxSize: Int) {
        self._head = head
        self._tail = tail
        self._maxSize = maxSize
    }

    /// 外部访问是通过 key
    /// 内部的操作通过 node，因为 node 才是双链表和 map 交易的桥梁
    ///
    func get(_ key: Int) -> Int {
        /// 1. fetch
        /// 2. update the access level

        if let node = _nodeMap[key] {
            moveToHead(node)
            return node.val
        }

        return -1  /// not found
    }


    func put(_ key: Int, _ value: Int) {
        /// 1. fetch
        ///    1.1 not exsit
        ///      1. store to map
        ///      2. insert to head
        ///      3. if full, delete tail
        ///    1.2 exist
        ///      1. moveToHead
        if let node = _nodeMap[key] {
            moveToHead(node)
        }
        else {
            let node = Node(key: key, val: value)
            _nodeMap[key] = node

            insertToHead(node)
            _size += 1
            if _size > _maxSize {
                deleteTail()
                _nodeMap[key] = nil  //update map
            }
        }
    }


    /// 提升访问等级
    func moveToHead(_ node: Node) {
        guard node !== _head else { return }  /// 头节点不需要提升
        /// 1. remove node
        /// 2. insert node
        deleteNode(node)
        insertToHead(node)
    }

    func deleteNode(_ node: Node) {
        var node = node
        node.pre?.next = node.next
        node.next?.pre = node.pre
    }

    func insertToHead(_ node: Node) {
        var node = node
        _head?.pre = node
        node.next = _head

        _head = node
    }

    func deleteTail() {
        let node = _tail?.pre
        _tail?.pre?.next = nil

        _tail = node
    }
}



