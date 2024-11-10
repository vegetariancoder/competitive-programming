class Node:
    def __init__(self,value):
        self.value = value
        self.next = None


class LinkedList:
    def __init__(self,value):
        new_node = Node(value)
        self.head = new_node
        self.tail = new_node
        self.length = 1

    def printList(self):
        temp = self.head
        while temp is not None:
            print(temp.value)
            temp = temp.next

    def append(self,value):
        new_node = Node(value)
        if self.head is None:
            self.head = new_node
            self.tail = new_node
        else:
            self.tail.next = new_node
            self.tail = new_node
        self.length+=1
        return "new node added"

    def pop(self):
        if self.length == 0:
            return None
        temp = self.head
        pre = self.head

        while temp.next:
            pre = temp
            temp = temp.next
            self.tail = pre
            self.length -=1
            if self.length == 0:
                self.head = None
                self.tail = None
        return temp.value

    def prePend(self,value):
        new_node = Node(value)
        if self.length == 0:
            self.head = new_node
            self.tail = new_node
        else:
            new_node.next = self.head
            self.head = new_node
        self.length +=1
        return "new node prepend"

    def popFirst(self):
        if self.length == 0:
            return None
        else:
            temp = self.head
            self.head = self.head.next
            temp.next = None
            self.length -=1
            if self.length == 0:
                self.tail = None
        return "first node popped"

    def get(self,index):
        if index < 0 or index >= self.length:
            return "Index not exists"
        temp = self.head
        for _ in range(index):
            temp = temp.next
        return temp

    def setValue(self,index,value):
        temp = self.get(index)
        if temp:
            temp.value = value
            return "value changed"
        return "exception"




my_linked_list = LinkedList(value=5)
print(my_linked_list.append(4))
print(my_linked_list.append(3))
print(my_linked_list.prePend(2))
my_linked_list.printList()
# print(my_linked_list.popFirst())
my_linked_list.printList()
print(my_linked_list.get(2))
my_linked_list.setValue(2,99)
my_linked_list.printList()
