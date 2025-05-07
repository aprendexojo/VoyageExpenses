#tag MobileContainer
Begin MobileContainer AddTripContainer
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   Compatibility   =   ""
   Device = 7
   Height          =   334
   Left            =   0
   Orientation = 0
   Top             =   0
   Visible         =   True
   Width           =   320
   Begin PlaceTable PlaceTable1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowEditing    =   True
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   PlaceTable1, 4, <Parent>, 4, False, +1.00, 4, 1, -*kStdGapCtlToViewV, , True
      AutoLayout      =   PlaceTable1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   PlaceTable1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   PlaceTable1, 3, DescriptionField, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      ControlCount    =   0
      currentEditedRowID=   0
      currentEditedRowValue=   ""
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   162
      Left            =   0
      LockedInPosition=   False
      RowSize         =   "PlaceTable.RowType.Regular"
      Scope           =   0
      SectionCount    =   0
      TintColor       =   &c000000
      Top             =   152
      Visible         =   True
      Width           =   320
      _ClosingFired   =   False
      _OpeningCompleted=   False
   End
   Begin MobileTextField BudgetField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   BudgetField, 8, , 0, False, +1.00, 4, 1, 34, , True
      AutoLayout      =   BudgetField, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   BudgetField, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   BudgetField, 3, SegmentedButton1, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      BorderStyle     =   3
      ControlCount    =   0
      Enabled         =   True
      Height          =   34
      Hint            =   "#kBudget"
      InputType       =   8
      Left            =   20
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      ReturnCaption   =   0
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   ""
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   37
      Visible         =   True
      Width           =   280
      _ClosingFired   =   False
   End
   Begin MobileTextArea DescriptionField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   DescriptionField, 8, , 0, False, +1.00, 4, 1, 53, , True
      AutoLayout      =   DescriptionField, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   DescriptionField, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   DescriptionField, 3, BudgetField, 4, False, +1.00, 4, 1, 20, , True
      BorderStyle     =   2
      ControlCount    =   0
      Enabled         =   True
      Height          =   53
      Left            =   20
      LockedInPosition=   False
      maximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   "#kDescriptionForTheLeisureTrip"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   91
      Visible         =   True
      Width           =   280
      _ClosingFired   =   False
   End
   Begin MobileSegmentedButton SegmentedButton1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   SegmentedButton1, 8, , 0, True, +1.00, 4, 1, 29, , True
      AutoLayout      =   SegmentedButton1, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   SegmentedButton1, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   SegmentedButton1, 3, <Parent>, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   SegmentedButton1, 10, <Parent>, 3, False, +1.00, 4, 1, 20, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   29
      LastSegmentIndex=   0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      SegmentCount    =   0
      Segments        =   "1\n\nTrue\r2\n\nFalse"
      SelectedSegmentIndex=   0
      TintColor       =   &c000000
      Top             =   0
      Visible         =   True
      Width           =   280
      _ClosingFired   =   False
   End
End
#tag EndMobileContainer

#tag WindowCode
	#tag Method, Flags = &h0
		Sub SelectionChanged(section as integer, row as integer)
		  RaiseEvent SelectionChanged(section, row)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event SelectionChanged(section as integer, row as integer)
	#tag EndHook


#tag EndWindowCode

#tag Events PlaceTable1
	#tag Event
		Sub Opening()
		  
		  me.AllowEditing = false
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(section As Integer, row As Integer)
		  self.SelectionChanged(section, row)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BudgetField
	#tag Event
		Sub Opening()
		  me.InputType = MobileTextField.InputTypes.Decimal
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedButton1
	#tag Event
		Sub Opening()
		  me.SegmentAt(0).Icon = Picture.SystemImage("sun.max", 24)
		  me.SegmentAt(1).Icon = Picture.SystemImage("keyboard", 24)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(segmentedIndex As Integer)
		  Select case segmentedIndex
		    
		  case 0
		    DescriptionField.Text = kDescriptionForTheLeisureTrip
		  case 1
		    DescriptionField.Text = kDescriptionForTheWorkTrip
		  End Select
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
