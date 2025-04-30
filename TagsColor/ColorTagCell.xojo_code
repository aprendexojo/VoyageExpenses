#tag IOSContainerControl
Begin MobileTableCustomCell ColorTagCell
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   AllowDynamicHeight=   False
   Compatibility   =   ""
   ControlCount    =   0
   Device = 7
   Enabled         =   True
   Height          =   50
   Left            =   0
   Orientation = 0
   TintColor       =   &c000000
   Top             =   0
   Visible         =   True
   Width           =   320
   Begin MobileLabel CategoryName
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   CategoryName, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   CategoryName, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   CategoryName, 10, <Parent>, 10, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   CategoryName, 7, , 0, False, +1.00, 4, 1, 196, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   20
      LineBreakMode   =   5
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   "Untitled"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   10
      Visible         =   True
      Width           =   196
      _ClosingFired   =   False
   End
   Begin ColorSwatch ColorSwatch1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowKeyEvents  =   False
      AutoLayout      =   ColorSwatch1, 7, , 0, False, +1.00, 4, 1, 40, , True
      AutoLayout      =   ColorSwatch1, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   ColorSwatch1, 3, <Parent>, 3, False, +1.00, 4, 1, 4, , True
      AutoLayout      =   ColorSwatch1, 8, , 0, False, +1.00, 4, 1, 40, , True
      ControlCount    =   0
      currentColor    =   &c00000000
      Enabled         =   True
      Height          =   40
      Left            =   260
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   4
      Visible         =   True
      Width           =   40
      _ClosingFired   =   False
   End
End
#tag EndIOSContainerControl

#tag WindowCode
#tag EndWindowCode

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
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
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
		InitialValue="MobileTableCustomCell"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityHint"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityLabel"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowDynamicHeight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
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
