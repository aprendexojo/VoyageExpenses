#tag Class
Protected Class CategoryTable
Inherits iOSMobileTable
	#tag Event
		Function ApplyActionsForRow(section As Integer, row As Integer) As iOSMobileTableRowAction()
		  Var Actions(0) As iOSMobileTableRowAction
		  Const kFlagTag As String = "Delete"
		  
		  // Create the Delete button
		  Actions(0) = New iOSMobileTableRowAction(iOSMobileTableRowAction.Styles.Destructive, "Delete", kFlagTag)
		  
		  Return Actions
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  data = new CategoryDataSource(me.RowSize)
		  me.DataSource = data
		  
		  RaiseEvent Opening
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddCategory(value() As String)
		  if value.LastIndex <> -1 then
		    var newValue as String = value(0).Trim
		    if newValue <> "" then
		      app.expensesDatabase.addCategory(newValue)
		      data.reloadCategories
		      me.ReloadDataSource
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteCategory(id As String)
		  app.expensesDatabase.deleteCategory(id)
		  data.reloadCategories
		  me.ReloadDataSource
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EditCategory(section as integer, row as integer, screen as MobileScreen)
		  Var selectedCell As MobileTableCellData = Me.RowCellData(section, row)
		  var cellcontrol as CategoryCell = CategoryCell( selectedCell.Control )
		  
		  
		  me.currentEditedRowID = cellcontrol.categoryID
		  me.currentEditedRowValue = cellcontrol.CategoryName.Text
		  var l as iOSLayoutContent = app.CurrentLayout.Content
		  iOSAlert.textInput(screen, "Category", "Change the Category Name", AddressOf me.UpdateCategory, "Cancel", "Ok", cellcontrol.CategoryName.Text)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadExpenses()
		  'me.RemoveAllRows
		  'me.AddSection
		  'var np() as Pair = app.expensesDatabase.GetCategories
		  '
		  'for Each item as pair in np
		  'var cell as mobileTableCellData = me.CreateCustomCell ( GetTypeInfo(CategoryCell) )
		  'cell.AccessoryType = MobileTableCellData.AccessoryTypes.Info
		  'var cellControl as CategoryCell = CategoryCell( cell.Control )
		  'cellControl.CategoryName.Text = item.Right.StringValue
		  'cellControl.categoryID = item.Left.IntegerValue
		  'me.AddRow(0, cell)
		  'Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCategory(value() as String)
		  if value.LastIndex <> -1 then
		    var newValue as String = value(0).Trim
		    if newValue <> currentEditedRowValue and currentEditedRowID <> -1 then
		      app.expensesDatabase.updateCategory(value(0), currentEditedRowID)
		      currentEditedRowValue = ""
		      currentEditedRowID = -1
		      data.reloadCategories
		      me.ReloadDataSource
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Opening()
	#tag EndHook


	#tag Property, Flags = &h0
		currentEditedRowID As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		currentEditedRowValue As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Data As CategoryDataSource
	#tag EndProperty

	#tag Property, Flags = &h0
		RowSize As RowType = RowType.small
	#tag EndProperty


	#tag Enum, Name = RowType, Type = Integer, Flags = &h0
		Regular
		Small
	#tag EndEnum


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
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="320"
			Type="Integer"
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
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="320"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ClosingFired"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="TintColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
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
			Name="EditingEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EstimatedRowHeight"
			Visible=true
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="iOSMobileTable.Formats"
			EditorType="Enum"
			#tag EnumValues
				"0 - Plain"
				"1 - Grouped"
				"2 - InsetGrouped"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="SectionCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
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
			Name="AllowRefresh"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowSearch"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OpeningCompleted"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentEditedRowID"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentEditedRowValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowSize"
			Visible=true
			Group="Behavior"
			InitialValue="RowType.small"
			Type="RowType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Regular"
				"1 - Small"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="UI Control"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
