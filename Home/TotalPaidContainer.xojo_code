#tag MobileContainer
Begin MobileContainer TotalPaidContainer
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   Compatibility   =   ""
   Device = 7
   Height          =   58
   Left            =   0
   Orientation = 0
   Top             =   0
   Visible         =   True
   Width           =   362
   Begin MobileRectangle Rectangle1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Rectangle1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Rectangle1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Rectangle1, 10, <Parent>, 10, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Rectangle1, 8, , 0, False, +1.00, 4, 1, 33, , True
      BorderColor     =   &c000000
      BorderThickness =   0.0
      ControlCount    =   0
      CornerSize      =   0.0
      Enabled         =   True
      FillColor       =   &c000000
      Height          =   33
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   12
      Visible         =   True
      Width           =   362
      _ClosingFired   =   False
   End
   Begin MobileCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowKeyEvents  =   False
      AutoLayout      =   Canvas1, 4, <Parent>, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   Canvas1, 3, <Parent>, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Canvas1, 7, <Parent>, 8, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   58
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   0
      Visible         =   True
      Width           =   58
      _ClosingFired   =   False
   End
End
#tag EndMobileContainer

#tag WindowCode
#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  g.DrawPicture paid, 0, 0, g.Width, g.Height, 0, 0, paid.Width, paid.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Width"
		Visible=false
		Group=""
		InitialValue="320"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="480"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
