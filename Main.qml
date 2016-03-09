import QtQuick 2.0
import Ubuntu.Components 1.1
import UserMetrics 0.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "usermetrics.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("usermetrics")

        Metric {
            id: incomingMessagesMetric
            name: "usermetric"
            format: i18n.tr("Usermetric messages received today: %1")
            emptyFormat: i18n.tr("No Usermetric messages received today.")
            domain: applicationName
        }

        Column {
            anchors.centerIn: parent
            spacing: units.gu(2)

            Button {
                text: i18n.tr("Increase")

                onClicked: {
                    console.log("Going to increase the metric!");
                    incomingMessagesMetric.increment()
                }
            }

            Button {
                text: i18n.tr("Decrease")

                onClicked: {
                    console.log("Going to increase the metric bye 2!");
                    incomingMessagesMetric.increment(2)
                }
            }

            Button {
                text: i18n.tr("Decrease")

                onClicked: {
                    console.log("Going to update to 3 to the metric!");
                    incomingMessagesMetric.update(3)
                }
            }

        }
    }
}

