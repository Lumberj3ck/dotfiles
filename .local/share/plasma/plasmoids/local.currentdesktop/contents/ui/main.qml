import QtQuick
import QtQuick.Layouts
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.taskmanager as TaskManager

PlasmoidItem {
    id: root

    preferredRepresentation: fullRepresentation

    TaskManager.VirtualDesktopInfo {
        id: desktopInfo
    }

    property var occupiedDesktopIds: []

    function updateOccupiedDesktops() {
        const occupied = [];

        for (let row = 0; row < tasksModel.count; ++row) {
            const modelIndex = tasksModel.index(row, 0);
            const isWindow = tasksModel.data(
                modelIndex, TaskManager.AbstractTasksModel.IsWindow);
            const isOnAllDesktops = tasksModel.data(
                modelIndex, TaskManager.AbstractTasksModel.IsOnAllVirtualDesktops);
            const skipPager = tasksModel.data(
                modelIndex, TaskManager.AbstractTasksModel.SkipPager);

            if (!isWindow || isOnAllDesktops || skipPager) {
                continue;
            }

            const desktopIds = tasksModel.data(
                modelIndex, TaskManager.AbstractTasksModel.VirtualDesktops);

            for (const desktopId of desktopIds) {
                if (occupied.indexOf(desktopId) === -1) {
                    occupied.push(desktopId);
                }
            }
        }

        occupiedDesktopIds = occupied;
    }

    TaskManager.TasksModel {
        id: tasksModel

        groupMode: TaskManager.TasksModel.GroupDisabled
        onCountChanged: root.updateOccupiedDesktops()
    }

    Connections {
        target: tasksModel

        function onDataChanged() {
            root.updateOccupiedDesktops();
        }

        function onModelReset() {
            root.updateOccupiedDesktops();
        }
    }

    Component.onCompleted: updateOccupiedDesktops()

    fullRepresentation: RowLayout {
        spacing: 6

        Repeater {
            model: desktopInfo.numberOfDesktops

            RowLayout {
                required property int index

                readonly property bool isCurrent:
                    desktopInfo.desktopIds[index] === desktopInfo.currentDesktop
                readonly property bool hasApps:
                    root.occupiedDesktopIds.indexOf(desktopInfo.desktopIds[index]) !== -1

                Item {
                    id: desktopIndicator

                    implicitWidth: 18
                    implicitHeight: desktopNumber.implicitHeight
                    Layout.minimumWidth: 18
                    Layout.fillHeight: true

                    PlasmaComponents.Label {
                        id: desktopNumber

                        anchors.fill: parent
                        visible: !isCurrent
                        text: index + 1
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: hasApps
                        opacity: hasApps ? 1 : 0.5
                    }

                    Rectangle {
                        anchors.centerIn: parent
                        anchors.verticalCenterOffset: 1
                        width: 9
                        height: 9
                        radius: 2
                        visible: isCurrent
                        color: PlasmaCore.Theme.textColor
                        opacity: 0.65
                    }
                }
            }
        }
    }
}
