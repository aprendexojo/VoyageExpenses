#tag Class
Protected Class Station
Inherits MobileCanvas
	#tag Event
		Sub Paint(g As Graphics)
		  g.Transparency = 70.0
		  g.DrawPicture currentStation, 0, 0, g.Width, g.Height, 0, 0, CurrentStation.Width, CurrentStation.Height
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  CurrentStation = Autumm
		  
		  stations = new Dictionary
		  
		  Var North As new Dictionary
		  Var South As new Dictionary
		  
		  North.Value(9) = Autumm
		  north.Value(10) = Autumm
		  North.Value(11) = Autumm
		  
		  north.Value(12) = Winter
		  North.Value(1) = Winter
		  North.Value(2) = Winter
		  
		  North.Value(3) = Spring
		  North.Value(4) = Spring
		  north.Value(5) = Spring
		  
		  north.Value(6) = Summer
		  North.Value(7) = Summer
		  North.Value(8) = Summer
		  
		  South.Value(3) = Autumm
		  South.Value(4) = Autumm
		  South.Value(5) = Autumm
		  
		  south.Value(6) = winter
		  South.Value(7) = winter
		  south.Value(8) = Winter
		  
		  South.Value(9) = Spring
		  south.Value(10) = Spring
		  south.Value(11) = Spring
		  
		  South.Value(12) = Summer
		  south.Value(1) = Summer
		  south.Value(2) = Summer
		  
		  stations.Value("North") = north
		  Stations.Value("South") = south
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLatitude() As Double
		  Return Latitude
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateWithLatitude(Latitude as Double)
		  me.Latitude = Latitude
		  
		  var month as integer = DateTime.Now.Month
		  var latitudeDictionary as Dictionary =  if(Latitude >= 0, Stations.Value("North"), stations.Value("South"))
		  
		  CurrentStation = latitudeDictionary.Value(month)
		  
		  me.Refresh
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected CurrentStation As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Latitude As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Stations As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="_ClosingFired"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TintColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityHint"
			Visible=false
			Group="UI Control"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Visible=false
			Group="UI Control"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="UI Control"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="UI Control"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowKeyEvents"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
