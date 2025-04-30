#tag MobileScreen
Begin MobileScreen ExpenseDetailScreen
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
   Title           =   "Expense Detail"
   Top             =   0
   Begin MobileScrollableArea ScrollableArea1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ScrollableArea1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ScrollableArea1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ScrollableArea1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ScrollableArea1, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, -*kStdControlGapV, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   739
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      ScrollContent   =   0
      TintColor       =   &c000000
      Top             =   65
      Visible         =   True
      Width           =   375
      _ClosingFired   =   False
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  Var saveButton As New MobileToolbarButton(MobileToolbarButton.Types.Save)
		  saveButton.Enabled = true
		  Self.RightNavigationToolbar.AddButton(saveButton)
		  
		  
		  ScrollableArea1.Container = DetailContainer
		  
		  DetailContainer.AmountField.Text = expense.Lookup(expensesdb.kAmount, "0")
		  DetailContainer.DescriptionField.Text = expense.Lookup(expensesdb.kDescription, "")
		  DetailContainer.NameField.Text = expense.Lookup(expensesdb.kName, "")
		  
		  for each item as pair in Categories
		    DetailContainer.CategoryTable1.AddRow item.Right.StringValue
		  next
		  
		  var locationValue as String = expense.Lookup(expensesdb.kLocation,"")
		  
		  if locationValue <> "" then
		    var latitude as Double = locationValue.NthField("#",1).ToDouble
		    var longitude as Double = locationValue.NthField("#",2).ToDouble
		    var location as new MapLocation(latitude, longitude)
		    DetailContainer.ExpenseMap.AddLocation location
		  end if
		  
		  var category as String = expense.Lookup(expensesdb.kCategory, "")
		  
		  DetailContainer.CurrentCategory.Text = "Current Category: " + Category
		  
		  if Category <> "" then
		    
		    for n as integer = 0 to DetailContainer.CategoryTable1.RowCount -1
		      if DetailContainer.CategoryTable1.RowCellData(n).Text = category then
		        DetailContainer.CategoryTable1.SelectRow(0, n)
		        exit
		      end if
		    next
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarButtonPressed(button As MobileToolbarButton)
		  if button.Type = MobileToolbarButton.Types.Save then
		    UpdateExpense
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(expense As Dictionary)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  DetailContainer = new ExpenseDetailContainer
		  
		  me.expense = expense
		  
		  Categories = app.expensesDatabase.GetCategories
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateExpense()
		  if expense <> nil then
		    
		    if DetailContainer.AmountField.Text <> "" then
		      expense.Value(expensesdb.kAmount) = DetailContainer.AmountField.Text
		    end if
		    
		    expense.Value(expensesdb.kName) = DetailContainer.NameField.Text
		    expense.Value(expensesdb.kDescription) = DetailContainer.DescriptionField.Text
		    
		    if DetailContainer.CategoryTable1.SelectedRow.Right <> -1 then
		      var s as String = DetailContainer.CategoryTable1.RowCellData(DetailContainer.CategoryTable1.SelectedRow.Right).Text
		      expense.Value(expensesdb.kCategory) = s
		    end if
		    
		    app.expensesDatabase.UpdateExpense(expense)
		    
		  end if
		  
		  self.Close
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Categories() As Pair
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DetailContainer As ExpenseDetailContainer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected expense As Dictionary
	#tag EndProperty


#tag EndWindowCode

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
	#tag ViewProperty
		Name="expense"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
