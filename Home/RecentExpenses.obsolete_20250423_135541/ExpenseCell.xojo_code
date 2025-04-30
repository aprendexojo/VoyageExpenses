#tag IOSContainerControl
Begin MobileTableCustomCell ExpenseCell
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   AllowDynamicHeight=   False
   Compatibility   =   ""
   ControlCount    =   0
   Device = 7
   Enabled         =   True
   Height          =   74
   Left            =   0
   Orientation = 0
   TintColor       =   &c000000
   Top             =   0
   Visible         =   True
   Width           =   320
   Begin MobileLabel CategoryLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   CategoryLabel, 7, , 0, False, +1.00, 4, 1, 100, , True
      AutoLayout      =   CategoryLabel, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   CategoryLabel, 3, <Parent>, 3, False, +1.00, 4, 1, 5, , True
      AutoLayout      =   CategoryLabel, 8, , 0, False, +1.00, 4, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   110
      LineBreakMode   =   4
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   "Untitled"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   12
      TintColor       =   &c000000
      Top             =   5
      Visible         =   True
      Width           =   100
      _ClosingFired   =   False
   End
   Begin MobileLabel DateLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   DateLabel, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   DateLabel, 7, , 0, False, +1.00, 4, 1, 90, , True
      AutoLayout      =   DateLabel, 2, CategoryLabel, 1, False, +1.00, 4, 1, -*kStdControlGapH, , True
      AutoLayout      =   DateLabel, 3, <Parent>, 3, False, +1.00, 4, 1, 5, , True
      AutoLayout      =   DateLabel, 8, , 0, False, +1.00, 4, 1, 30, , True
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
      TextSize        =   12
      TintColor       =   &c000000
      Top             =   5
      Visible         =   True
      Width           =   82
      _ClosingFired   =   False
   End
   Begin MobileLabel AmountLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   2
      AutoLayout      =   AmountLabel, 1, CategoryLabel, 2, False, +1.00, 4, 1, *kStdControlGapH, , True
      AutoLayout      =   AmountLabel, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   AmountLabel, 3, <Parent>, 3, False, +1.00, 4, 1, 5, , True
      AutoLayout      =   AmountLabel, 8, , 0, False, +1.00, 4, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   218
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
      TextSize        =   12
      TintColor       =   &c000000
      Top             =   5
      Visible         =   True
      Width           =   82
      _ClosingFired   =   False
   End
   Begin MobileLabel DescriptionLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   DescriptionLabel, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   DescriptionLabel, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   DescriptionLabel, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   DescriptionLabel, 3, <Parent>, 3, False, +1.00, 4, 1, 38, , True
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
      Top             =   38
      Visible         =   True
      Width           =   280
      _ClosingFired   =   False
   End
End
#tag EndIOSContainerControl

#tag WindowCode
#tag EndWindowCode

#tag Events DescriptionLabel
	#tag Event
		Sub Opening()
		  me.TextColor = new ColorGroup(color.gray, color.LightGray)
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
