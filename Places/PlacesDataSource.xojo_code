#tag Class
Protected Class PlacesDataSource
Implements iOSMobileTableDataSource, iOSMobileTableDataSourceEditing
	#tag Method, Flags = &h0
		Function AllowRowEditing(table As iOSMobileTable, section As Integer, row As Integer) As Boolean
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(RowSize as PlaceTable.RowType)
		  me.RowSize = RowSize
		  reloadPlaces
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadPlaces()
		  data = app.expensesDatabase.getPlaces
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
		  
		  // Part of the iOSMobileTableDataSource interface.
		  var cell as mobileTableCellData
		  
		  cell = table.CreateCustomCell ( GetTypeInfo(PlaceCell) )
		  
		  var cellControl as PlaceCell = placeCell( cell.Control )
		  var textSize as integer
		  
		  Select case me.RowSize
		  case PlaceTable.RowType.Regular
		    textSize = 15
		  case PlaceTable.RowType.Small
		    textSize = 12
		  End Select
		  cellControl.PlaceNameField.TextFont = font.SystemFont( textSize )
		  cellControl.PlaceNameField.Text = data(row).Right.StringValue
		  cellControl.placeID = data(row).Left.IntegerValue
		  
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
		Protected data() As Pair
	#tag EndProperty

	#tag Property, Flags = &h0
		RowSize As PlaceTable.RowType = PlaceTable.RowType.Regular
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
			Name="data()"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
