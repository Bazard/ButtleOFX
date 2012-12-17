import QtQuick 1.1

Item {
    id: node
    
    height: 35 + 7*_nodeManager.getWrapper(node).nbInput
    width: 110
    x: _nodeManager.getWrapper(node).x
    y: _nodeManager.getWrapper(node).y
    z: _nodeManager.getZMax()
    focus: true

    Keys.onPressed: {
            if (event.key == Qt.Key_Delete) {
                    _nodeManager.deleteCurrentNode()
            }
    }

    Rectangle {
        id: nodeBorder
        height: node.height
        width: node.width
        anchors.centerIn: parent
        color: _nodeManager.getWrapper(node).color
        opacity: 0.5
        radius: 10
    }
    Rectangle {
        id: nodeRectangle
        anchors.centerIn: parent
        height: node.height - 8
        width: node.width - 8
        color: "#bbbbbb"
        radius: 8
        Text {
            id: nodeName
            anchors.centerIn: parent
            text: _nodeManager.getWrapper(node).name
            font.pointSize: 10
            color: "black"
        }
    }
    Column {
        id: nodeInputs
        anchors.horizontalCenter: parent.left
        anchors.verticalCenter: parent.verticalCenter
        spacing: 2
        Repeater {
            model: _nodeManager.getWrapper(node).nbInput
            Rectangle {
                id: nodeInput
                height: 5
                width: 5
                color: "#bbbbbb"
                radius: 2
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: {
                        color = "red"
                        console.log("Input clicked");
                        _connectionManager.inputPressed(nodeName.text, "in" + index) // we spent the node name and the id of the input
                    }
                    onReleased: {
                        color = "#bbbbbb"
                        _connectionManager.inputReleased(nodeName.text, "in" + index)
                    }
                    onEntered: {
                        color = "blue"
                    }
                    onExited: {
                        color = "#bbbbbb"
                    }
                }
            }
        }
    }
    Column {
        id: nodeOutput
        anchors.horizontalCenter: parent.right
        anchors.verticalCenter: parent.verticalCenter
        spacing: 2

        Repeater {
            model: 1
            Rectangle {
                id: nodeOutput
                height: 5
                width: 5
                color: "#bbbbbb"
                radius: 2
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: {
                        color = "red"
                        console.log("Output clicked");
                        _connectionManager.outputPressed(nodeName.text, "out" + index)
                    }
                    onReleased: {
                        color = "#bbbbbb"
                        _connectionManager.outputReleased(nodeName.text, "out" + index)
                    }
                    onEntered: {
                        color = "blue"
                    }
                    onExited: {
                        color = "#bbbbbb"
                    }
                }
            }
        }
    }
    states: State {
        name: "selected";
        when: _nodeManager.currentNode == node
        PropertyChanges {
            target: nodeRectangle
            color: "#d9d9d9"
        }
    }
    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        onPressed: {
            _nodeManager.currentNode = node
            parent.opacity = 0.5
            if(_nodeManager.currentNode != node) {
                _nodeManager.setZMax()
                parent.z = _nodeManager.getZMax()
                console.log(parent.z)
            }
            
        }
        onReleased: {
            parent.opacity = 1
        }
    }   
}
