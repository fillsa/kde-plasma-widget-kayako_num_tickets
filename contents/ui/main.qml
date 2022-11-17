/*
 *   SPDX-FileCopyrightText: 2022 Alexandr Filimonov <fill.sa@mail.ru>
 *
 *   SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick 2.2
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kquickcontrolsaddons 2.0 as QtExtra
import org.kde.plasma.private.timer 0.1 as TimerPlasmoid

Item {
    id: root
//    console.log("Item start")
        
    width: units.gridUnit 
    height: units.gridUnit
    Plasmoid.backgroundHints: PlasmaCore.Types.ShadowBackground | PlasmaCore.Types.ConfigurableBackground
    
    // Always display the full view. Never show the compact icon view
    // like it does by default when shown in the panel.
    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
    Plasmoid.compactRepresentation: Plasmoid.fullRepresentation
//    Plasmoid.fullRepresentation: FullView {}
    
 //   FullView { text: "Hello world in Plasma 5 "; color: "black"; }
    
    
    Row {
        
        spacing: 5 // отступ между колонками
        
		Rectangle {
			id: rowmisscall
			
			color: "#F8B8B8"
			width: root.width
			height: root.height
			radius: 8
		}
		Rectangle {
			id: rowopennew
			
			color: "#F8B8B8"
			width: root.width
			height: root.height
			radius: 8
		}
		Rectangle {
			id: rowl0
			
			color: "#337AB7"
			width: root.width
			height: root.height
			radius: 8
		}
		Rectangle {
			id: rowl1
			
			color: "#337AB7"
			width: root.width
			height: root.height
			radius: 8
		}
		Rectangle {
			id: rowl2
			
			color: "#337AB7"
			width: root.width
			height: root.height
			radius: 8
		}
    }
    
    Row {
        spacing: 5 // отступ между колонками

        Text {
			id: textmisscall
			
			width: rowmisscall.width
			height: rowmisscall.height
            text: '--'
            color: "white"
            horizontalAlignment: Text.AlignHCenter
			font.pointSize: 0.5 * height
//            font.pixelSize: 0.65 * height

        }
        Text {
			id: textopennew
			width: rowopennew.width
			height: rowopennew.height
            text: '--'
            color: "white"
            horizontalAlignment: Text.AlignHCenter
			font.pointSize: 0.5 * height
//            font.pixelSize: 0.65 * height
        }
        Text {
			id: textl0
			width: rowl0.width
			height: rowl0.height
            text: '--'
            color: "white"
            horizontalAlignment: Text.AlignHCenter
			font.pointSize: 0.5 * height
//            font.pixelSize: 0.65 * height
        }
        Text {
			id: textl1
			width: rowl1.width
			height: rowl1.height
            text: '--'
            color: "white"
            horizontalAlignment: Text.AlignHCenter
			font.pointSize: 0.5 * height
//            font.pixelSize: 0.65 * height
        }
        Text {
			id: textl2
			width: rowl2.width
			height: rowl2.height
            text: '--'
            color: "white"
            horizontalAlignment: Text.AlignHCenter
			font.pointSize: 0.5 * height
//            font.pixelSize: 0.65 * height
        }
    } // Row end
    
    
    
    Timer {
        id: numticetupdaTimer

        interval: 30000
        running: true;
        repeat: true;

        onTriggered: {
            console.log("Timer");
            numticetupda(); // обновить значения
        }
    }
    
    function timetstart(){
    numticetupdaTimer.start()
	}
	
    function numticetupda(){
            console.log("numticetupda");
    
            var xhttp = new XMLHttpRequest()
			var url = "http://000.000.000.000/support";
			xhttp.open("GET", url, true);

			// Send the proper header information along with the request
			xhttp.responseType = 'json';
//			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//        xhttp.setRequestHeader("Content-length", params.length);
			xhttp.setRequestHeader("Connection", "close");

			xhttp.onreadystatechange = function() { // Call a function when the state changes.
                    if (xhttp.readyState == 4  && xhttp.status == 200) {
                            console.log("ok\n")
								var myArr = JSON.parse(xhttp.responseText); 
								console.log('My response: ', xhttp.responseText);
//								console.log('My response JSON: ', myArr); // JSON response 

								textmisscall.text = myArr.open_missed;
								textopennew.text = myArr.open_new;
								textl0.text = myArr.open_l0;
								textl1.text = myArr.open_l1;
								textl2.text = myArr.open_l2;
								textmisscall.color = 'white'
								textopennew.color = 'white'
								textl0.color = 'white'
								textl1.color = 'white'
								textl2.color = 'white'
							return this.responseText
                        } else {
                            console.log("error:\n " + xhttp.status)
/*								textmisscall.text = '--'
								textopennew.text = '--'
								textl0.text = '--'
								textl1.text = '--'
								textl2.text = '--'*/
								textmisscall.color = 'red'
								textopennew.color = 'red'
								textl0.color = 'red'
								textl1.color = 'red'
								textl2.color = 'red'
                    }
                }
			xhttp.send();
			
			
    }
    
   
    
    
   

    
}

