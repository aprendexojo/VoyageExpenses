#tag Class
Protected Class ColorTagDataSource
Implements iOSMobileTableDataSource
	#tag Method, Flags = &h0
		Function RowCount(table As iOSMobileTable, section As Integer) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  return app.cachedColors.Count
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowData(table As iOSMobileTable, section As Integer, row As Integer) As MobileTableCellData
		  // Part of the iOSMobileTableDataSource interface.
		  
		  if row <> -1 then
		    var cell as MobileTableCellData
		    
		    cell = table.CreateCustomCell( GetTypeInfo( ColorTagCell))
		    var cellControl as ColorTagCell = ColorTagCell( cell.Control )
		    
		    var item as String = app.cachedColors.KeyAt( row )
		    var c as color = color.FromString( app.cachedColors.value( item ).StringValue )
		    
		    cellControl.CategoryName.Text = item
		    cellControl.ColorSwatch1.currentColor = c
		    
		    Return cell
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionCount(table As iOSMobileTable) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Return 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionTitle(table As iOSMobileTable, section As Integer) As String
		  // Part of the iOSMobileTableDataSource interface.
		  
		  
		End Function
	#tag EndMethod


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
	#tag EndViewBehavior
End Class
#tag EndClass
