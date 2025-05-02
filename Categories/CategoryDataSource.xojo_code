#tag Class
Protected Class CategoryDataSource
Implements iOSMobileTableDataSource,iOSMobileTableDataSourceEditing
	#tag Method, Flags = &h0
		Function AllowRowEditing(table As iOSMobileTable, section As Integer, row As Integer) As Boolean
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rowSize as CategoryTable.RowType)
		  me.rowSize = rowSize
		  reloadCategories
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub reloadCategories()
		  data = app.expensesDatabase.GetCategories
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowCount(table As iOSMobileTable, section As Integer) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Return data.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowData(table As iOSMobileTable, section As Integer, row As Integer) As MobileTableCellData
		  // Part of the iOSMobileTableDataSource interface.
		  var cell as mobileTableCellData
		  
		  cell = table.CreateCustomCell ( GetTypeInfo(CategoryCell) )
		  
		  var cellControl as CategoryCell = CategoryCell( cell.Control )
		  
		  var textSize as integer
		  
		  Select case me.rowSize
		    
		  case CategoryTable.RowType.Small
		    textSize = 12
		  case categoryTable.RowType.Regular
		    textSize = 15
		  End Select
		  
		  cellControl.CategoryName.TextFont = font.SystemFont( textSize )
		  cellControl.CategoryName.Text = data(row).Right.StringValue
		  cellControl.categoryID = data(row).Left.IntegerValue
		  
		  Return cell
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowEditingCompleted(table As iOSMobileTable, section As Integer, row As Integer, action As iOSMobileTable.RowEditingStyles)
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionCount(table As iOSMobileTable) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  return 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionTitle(table As iOSMobileTable, section As Integer) As String
		  // Part of the iOSMobileTableDataSource interface.
		  
		  return ""
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected data() As pair
	#tag EndProperty

	#tag Property, Flags = &h0
		rowSize As CategoryTable.RowType = categoryTable.RowType.Small
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="rowSize"
			Visible=false
			Group="Behavior"
			InitialValue="categoryTable.RowType.Small"
			Type="CategoryTable.RowType"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
