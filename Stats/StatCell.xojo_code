#tag IOSContainerControl
Begin MobileTableCustomCell StatCell
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   AllowDynamicHeight=   False
   Compatibility   =   ""
   ControlCount    =   0
   Device = 7
   Enabled         =   True
   Height          =   133
   Left            =   0
   Orientation = 0
   TintColor       =   &c000000
   Top             =   0
   Visible         =   True
   Width           =   492
   Begin MobileLabel DateLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   DateLabel, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   DateLabel, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   DateLabel, 3, <Parent>, 3, False, +1.00, 4, 1, *kStdGapCtlToViewV, , True
      AutoLayout      =   DateLabel, 7, , 0, False, +1.00, 4, 1, 100, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   "Untitled"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   11
      TintColor       =   &c000000
      Top             =   20
      Visible         =   True
      Width           =   100
      _ClosingFired   =   False
   End
   Begin MobileLabel PlaceName
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   PlaceName, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   PlaceName, 1, DateLabel, 2, False, +1.00, 4, 1, *kStdControlGapH, , True
      AutoLayout      =   PlaceName, 2, TypeIcon, 1, False, +1.00, 4, 1, -*kStdControlGapH, , True
      AutoLayout      =   PlaceName, 3, <Parent>, 3, False, +1.00, 4, 1, 20, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   128
      LineBreakMode   =   0
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   "Untitled"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   15
      TintColor       =   &c000000
      Top             =   20
      Visible         =   True
      Width           =   246
      _ClosingFired   =   False
   End
   Begin TripTypeIcon TypeIcon
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowKeyEvents  =   False
      AutoLayout      =   TypeIcon, 8, , 0, False, +1.00, 4, 1, 90, , True
      AutoLayout      =   TypeIcon, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   TypeIcon, 3, PlaceName, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   TypeIcon, 7, , 0, False, +1.00, 4, 1, 90, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   90
      icon            =   0
      Left            =   382
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   20
      Visible         =   True
      Width           =   90
      _ClosingFired   =   False
   End
   Begin MobileLabel Description
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Description, 8, , 0, False, +1.00, 4, 1, 55, , True
      AutoLayout      =   Description, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   Description, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   Description, 3, PlaceName, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   55
      Left            =   20
      LineBreakMode   =   1
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   ""
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   58
      Visible         =   True
      Width           =   452
      _ClosingFired   =   False
   End
End
#tag EndIOSContainerControl

#tag WindowCode
	#tag Property, Flags = &h0
		Tag As Variant
	#tag EndProperty


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
