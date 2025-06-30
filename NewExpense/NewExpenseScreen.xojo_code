#tag MobileScreen
Begin MobileScreen NewExpenseScreen
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   Device = 7
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   Orientation = 0
   ScaleFactor     =   0.0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c000000
   Title           =   "#kNewExpense"
   Top             =   0
   Begin MobileTextField AmountField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   AmountField, 8, , 0, False, +1.00, 4, 1, 34, , True
      AutoLayout      =   AmountField, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, AmountLeft, True
      AutoLayout      =   AmountField, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, AmountRight, True
      AutoLayout      =   AmountField, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      BorderStyle     =   3
      ControlCount    =   0
      Enabled         =   True
      Height          =   34
      Hint            =   "#kAmount"
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
      TextSize        =   22
      TintColor       =   &c000000
      Top             =   73
      Visible         =   True
      Width           =   335
      _ClosingFired   =   False
   End
   Begin CategoryTable CategoryTable1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   CategoryTable1, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, -*kStdControlGapV, , True
      AutoLayout      =   CategoryTable1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   CategoryTable1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   CategoryTable1, 3, DescriptionField, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      ControlCount    =   0
      currentEditedRowID=   -1
      currentEditedRowValue=   ""
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   580
      Left            =   0
      LockedInPosition=   False
      RowSize         =   0
      Scope           =   0
      SectionCount    =   0
      TintColor       =   &c000000
      Top             =   224
      Visible         =   True
      Width           =   375
      _ClosingFired   =   False
      _OpeningCompleted=   False
   End
   Begin MobileTextArea DescriptionField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   DescriptionField, 8, , 0, False, +1.00, 4, 1, 59, , True
      AutoLayout      =   DescriptionField, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, DescriptionLeft, True
      AutoLayout      =   DescriptionField, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, DescriptionRight, True
      AutoLayout      =   DescriptionField, 3, NameField, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      BorderStyle     =   2
      ControlCount    =   0
      Enabled         =   True
      Height          =   59
      Left            =   20
      LockedInPosition=   False
      maximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   2
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   "#kDescriptionForTheExpense"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   157
      Visible         =   True
      Width           =   335
      _ClosingFired   =   False
   End
   Begin MobileTextField NameField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   1
      AutoLayout      =   NameField, 8, , 0, False, +1.00, 4, 1, 34, , True
      AutoLayout      =   NameField, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, NameLeft, True
      AutoLayout      =   NameField, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, NameRight, True
      AutoLayout      =   NameField, 3, AmountField, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      BorderStyle     =   3
      ControlCount    =   0
      Enabled         =   True
      Height          =   34
      Hint            =   "#kName"
      InputType       =   0
      Left            =   20
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      ReturnCaption   =   0
      Scope           =   2
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   ""
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   22
      TintColor       =   &c000000
      Top             =   115
      Visible         =   True
      Width           =   335
      _ClosingFired   =   False
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Activated()
		  AmountField.SetFocus
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  var bt as new MobileToolbarButton(MobileToolbarButton.Types.add)
		  me.RightNavigationToolbar.AddButton(bt)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarButtonPressed(button As MobileToolbarButton)
		  if button.Type = MobileToolbarButton.Types.add then
		    if AmountField.Text <> "" and CategoryTable1.SelectedRow.Right <> -1 then
		      
		      var p as pair = CategoryTable1.SelectedRow
		      Var selectedCell As MobileTableCellData = CategoryTable1.RowCellData(p.left, p.right)
		      var cellcontrol as CategoryCell = CategoryCell( selectedCell.Control )
		      
		      var date as double = DateTime.Now.SecondsFrom1970
		      var amount as String = AmountField.Text.Trim
		      var name as String = NameField.Text.trim
		      var categoryID as integer = cellcontrol.categoryID
		      var description as String = DescriptionField.Text.Trim
		      
		      var d as new Dictionary
		      d.Value(ExpensesDB.kDate) = date
		      d.Value(ExpensesDB.kAmount) = amount
		      d.Value(ExpensesDB.kName) = name
		      d.Value(ExpensesDB.kCategoryID) = categoryID
		      d.Value(ExpensesDB.kDescription) = description
		      d.Value(Expensesdb.kLocation) = if(CurrentLocation <> nil, CurrentLocation.Left + "#" + CurrentLocation.Right, "-1#-1")
		      
		      app.expensesDatabase.addExpense(tripID, d)
		      
		      self.Close
		      
		    else
		      MessageBox( kAmountOrCategoryNotSet )
		    end if
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(tripID As Integer, currentLocation As Pair = nil)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  me.tripID = tripID
		  me.CurrentLocation = currentLocation
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected CurrentLocation As pair
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected tripID As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events AmountField
	#tag Event
		Sub Opening()
		  var i as integer = iOSLayoutConstraint.StandardGap.Size
		  
		  var cs as new iOSLayoutConstraint(me, _
		  iOSLayoutConstraint.AttributeTypes.LeftMargin, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  self, iOSLayoutConstraint.AttributeTypes.LeftMargin, 1.0, i, 1000)
		  
		  var cs2 as new iOSLayoutConstraint(me, _
		  iOSLayoutConstraint.AttributeTypes.RightMargin, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  self, iOSLayoutConstraint.AttributeTypes.RightMargin, 1.0, -i, 1000)
		  
		  self.Constraint("AmountLeft").Active = false
		  self.Constraint("AmountRight").Active = false
		  
		  self.AddConstraint cs
		  self.AddConstraint cs2
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DescriptionField
	#tag Event
		Sub Opening()
		  var i as integer = iOSLayoutConstraint.StandardGap.Size
		  
		  var cs as new iOSLayoutConstraint(me, _
		  iOSLayoutConstraint.AttributeTypes.LeftMargin, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  self, iOSLayoutConstraint.AttributeTypes.LeftMargin, 1.0, i, 1000)
		  
		  var cs2 as new iOSLayoutConstraint(me, _
		  iOSLayoutConstraint.AttributeTypes.RightMargin, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  self, iOSLayoutConstraint.AttributeTypes.RightMargin, 1.0, -i, 1000)
		  
		  self.Constraint("DescriptionLeft").Active = false
		  self.Constraint("DescriptionRight").Active = false
		  
		  self.AddConstraint cs
		  self.AddConstraint cs2
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NameField
	#tag Event
		Sub Opening()
		  var i as integer = iOSLayoutConstraint.StandardGap.Size
		  
		  var cs as new iOSLayoutConstraint(me, _
		  iOSLayoutConstraint.AttributeTypes.LeftMargin, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  self, iOSLayoutConstraint.AttributeTypes.LeftMargin, 1.0, i, 1000)
		  
		  var cs2 as new iOSLayoutConstraint(me, _
		  iOSLayoutConstraint.AttributeTypes.RightMargin, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  self, iOSLayoutConstraint.AttributeTypes.RightMargin, 1.0, -i, 1000)
		  
		  self.Constraint("NameLeft").Active = false
		  self.Constraint("NameRight").Active = false
		  
		  self.AddConstraint cs
		  self.AddConstraint cs2
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
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
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
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
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScaleFactor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
