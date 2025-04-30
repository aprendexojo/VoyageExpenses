#tag MobileScreen
Begin MobileScreen NewTripScreen
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
   Title           =   "New Trip"
   Top             =   0
   Begin AddTripContainer AddTripC
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   AddTripC, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, -*kStdControlGapV, , True
      AutoLayout      =   AddTripC, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   AddTripC, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   AddTripC, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   739
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   65
      Visible         =   True
      Width           =   375
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Deactivated()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  var bt as new MobileToolbarButton(MobileToolbarButton.Types.add)
		  bt.Enabled = False
		  me.RightNavigationToolbar.AddButton bt
		  
		  'AddTripC = new AddTripContainer
		  '
		  'ScrollableArea1.Container = AddTripC
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarButtonPressed(button As MobileToolbarButton)
		  if button.Type = MobileToolbarButton.Types.add then
		    if addtripc.PlaceTable1.SelectedRow.Right <> -1 then
		      
		      var p as pair = addtripc.PlaceTable1.SelectedRow
		      Var selectedCell As MobileTableCellData = addtripc.placetable1.RowCellData(p.left, p.right)
		      var cellcontrol as PlaceCell = PlaceCell( selectedCell.Control )
		      
		      var d as new Dictionary
		      d.Value(ExpensesDB.kPlaceID) = cellcontrol.placeID
		      d.Value(ExpensesDB.kBudget) = addtripc.BudgetField.Text.trim
		      d.Value(expensesdb.kDescription) = addtripc.DescriptionField.Text.trim
		      d.Value(ExpensesDB.kTripType) = addtripc.SegmentedButton1.SelectedSegmentIndex
		      d.Value(ExpensesDB.kIsOpen) = true
		      
		      TripAdded( d )
		      
		    end if
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub TripAdded(values as Dictionary)
		  app.expensesDatabase.addTrip(values)
		  self.Close
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events AddTripC
	#tag Event
		Sub SelectionChanged(section as integer, row as integer)
		  self.RightNavigationToolbar.ButtonAt(0).Enabled = row <> -1
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
