#tag MobileContainer
Begin MobileContainer ExpenseDetailContainer
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   Compatibility   =   ""
   Device = 7
   Height          =   668
   Left            =   0
   Orientation = 0
   Top             =   0
   Visible         =   True
   Width           =   390
   Begin MobileTextField AmountField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   AmountField, 1, <Parent>, 1, False, +1.00, 4, 1, 20, , True
      AutoLayout      =   AmountField, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   AmountField, 3, <Parent>, 3, False, +1.00, 4, 1, *kStdGapCtlToViewV, , True
      AutoLayout      =   AmountField, 8, , 0, False, +1.00, 4, 1, 34, , True
      BorderStyle     =   3
      ControlCount    =   0
      Enabled         =   True
      Height          =   34
      Hint            =   "Expense amount"
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
      TextSize        =   15
      TintColor       =   &c000000
      Top             =   20
      Visible         =   True
      Width           =   350
      _ClosingFired   =   False
   End
   Begin MobileTextField NameField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   NameField, 1, AmountField, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   NameField, 2, AmountField, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   NameField, 3, AmountField, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   NameField, 8, , 0, False, +1.00, 4, 1, 34, , True
      BorderStyle     =   3
      ControlCount    =   0
      Enabled         =   True
      Height          =   34
      Hint            =   "Name"
      InputType       =   0
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
      TextSize        =   15
      TintColor       =   &c000000
      Top             =   62
      Visible         =   True
      Width           =   350
      _ClosingFired   =   False
   End
   Begin MobileTextArea DescriptionField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   DescriptionField, 1, NameField, 1, False, +1.00, 4, 1, 2, , True
      AutoLayout      =   DescriptionField, 2, NameField, 2, False, +1.00, 4, 1, 2, , True
      AutoLayout      =   DescriptionField, 3, NameField, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   DescriptionField, 8, , 0, False, +1.00, 4, 1, 79, , True
      BorderStyle     =   2
      ControlCount    =   0
      Enabled         =   True
      Height          =   79
      Left            =   22
      LockedInPosition=   False
      maximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   ""
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   15
      TintColor       =   &c000000
      Top             =   104
      Visible         =   True
      Width           =   350
      _ClosingFired   =   False
   End
   Begin MobileMapViewer ExpenseMap
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ExpenseMap, 8, , 0, False, +1.00, 4, 1, 217, , True
      AutoLayout      =   ExpenseMap, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   ExpenseMap, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   ExpenseMap, 3, <Parent>, 3, False, +1.00, 4, 1, 431, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   217
      Latitude        =   0.0
      Left            =   20
      LockedInPosition=   False
      Longitude       =   0.0
      MapType         =   0
      Scope           =   0
      TintColor       =   &c000000
      Top             =   431
      TrackMode       =   0
      Visible         =   True
      Width           =   350
      ZoomRadius      =   200.0
      _ClosingFired   =   False
   End
   Begin CategoryTable CategoryTable1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   CategoryTable1, 8, , 0, False, +1.00, 4, 1, 143, , True
      AutoLayout      =   CategoryTable1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   CategoryTable1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   CategoryTable1, 3, DescriptionField, 4, False, +1.00, 4, 1, 65, , True
      ControlCount    =   0
      currentEditedRowID=   -1
      currentEditedRowValue=   ""
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   12
      Format          =   0
      Height          =   143
      Left            =   0
      LockedInPosition=   False
      RowSize         =   0
      Scope           =   0
      SectionCount    =   0
      TintColor       =   &c000000
      Top             =   248
      Visible         =   True
      Width           =   390
      _ClosingFired   =   False
      _OpeningCompleted=   False
   End
   Begin MobileTextField CurrentCategory
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   CurrentCategory, 1, ExpenseMap, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   CurrentCategory, 7, , 0, False, +1.00, 4, 1, 361, , True
      AutoLayout      =   CurrentCategory, 3, DescriptionField, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   CurrentCategory, 8, , 0, False, +1.00, 4, 1, 34, , True
      BorderStyle     =   3
      ControlCount    =   0
      Enabled         =   True
      Height          =   34
      Hint            =   ""
      InputType       =   0
      Left            =   20
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   -1
      Parent          =   ""
      Password        =   False
      ReadOnly        =   True
      ReturnCaption   =   0
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   ""
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   15
      TintColor       =   &c000000
      Top             =   191
      Visible         =   True
      Width           =   361
      _ClosingFired   =   False
   End
End
#tag EndMobileContainer

#tag WindowCode
	#tag Constant, Name = kCurrentCategory, Type = String, Dynamic = False, Default = \"Current Category: ", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events CategoryTable1
	#tag Event
		Sub SelectionChanged(section As Integer, row As Integer)
		  var cell as MobileTableCellData = me.RowCellData(row)
		  var cellControl as CategoryCell = CategoryCell(cell.Control)
		  currentCategory.text = kCurrentCategory + cellControl.CategoryName.Text 
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
