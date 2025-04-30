#tag Module
Protected Module iOSAlert
	#tag Method, Flags = &h1
		Protected Sub actionBox(callerView as MobileScreen, title as String, description as String, cb as iosAlert.cb_actionIndex, actions() as String, cancelAction as String = "", destructiveAction as String = "")
		  actionsAddresses.ResizeTo(-1)
		  actionsAddresses.Append 0 //Cancel
		  actionsAddresses.Append 0 //destructiveAction
		  if cb=nil then Return
		  actionMode=ModeAction.indexed
		  indexedAction=cb
		  
		  Var UIAlertController as Ptr
		  Declare Function alertControllerWithTitlemessagepreferredStyle lib "UIKit" selector "alertControllerWithTitle:message:preferredStyle:" (class_ref as Ptr,title as CFStringRef,message as CFStringRef,preferredStyle as UIAlertControllerStyle) as Ptr
		  UIAlertController=alertControllerWithTitlemessagepreferredStyle(NSClassFromString("UIAlertController"),title,description,UIAlertControllerStyle.Alert)
		  
		  Declare Function actionWithTitlestylehandler lib "UIKit" selector "actionWithTitle:style:handler:" (class_ref as Ptr,title as CFStringRef,style as UIAlertActionStyle,handler as Ptr) as Ptr
		  Declare Sub addAction lib "Foundation" selector "addAction:" (obj_ref as Ptr,action as Ptr)
		  Var ib As new iOSBlock(AddressOf actionBoxAction)
		  Var bAction As Ptr
		  
		  Var actionClass as Ptr=NSClassFromString("UIAlertAction")
		  for i as integer=0 to actions.Ubound
		    bAction=actionWithTitlestylehandler(actionClass,actions(i),UIAlertActionStyle.Default,ib.Handle)
		    addAction(UIAlertController,bAction)
		    actionsAddresses.Append uinteger(bAction)
		  next
		  
		  if destructiveAction<>"" then
		    bAction=actionWithTitlestylehandler(actionClass,destructiveAction,UIAlertActionStyle.Destructive,ib.Handle)
		    addAction(UIAlertController,bAction)
		    actionsAddresses(1)=UInteger(bAction)
		  end if
		  
		  if cancelAction<>"" then
		    bAction=actionWithTitlestylehandler(actionClass,cancelAction,UIAlertActionStyle.Cancel,ib.Handle)
		    addAction(UIAlertController,bAction)
		    actionsAddresses(0)=UInteger(bAction)
		  end if
		  
		  if actionsAddresses.Ubound=1 and actionsAddresses(0)=0 and actionsAddresses(1)=0 then  //A button must exist
		    bAction=actionWithTitlestylehandler(actionClass,"CANCEL",UIAlertActionStyle.Cancel,ib.Handle)
		    addAction(UIAlertController,bAction)
		    actionsAddresses(0)=UInteger(bAction)
		  end if
		  
		  Declare Sub presentViewControlleranimatedcompletion lib "UIKit" selector "presentViewController:animated:completion:" (obj_ref as Ptr,viewControllerToPresent as Ptr,flag as Boolean,completion as Ptr)
		  presentViewControlleranimatedcompletion(callerView.ViewControllerHandle,UIAlertController,True,Nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub actionBox(callerView as MobileScreen, title as String, description as String, cb as iosAlert.cb_actionTag, actions() as iOSAlert.tagPair, cancelAction as String = "", destructiveAction as String = "")
		  actionsAddresses.ResizeTo(-1)
		  actionTags.ResizeTo(-1)
		  actionsAddresses.Append 0 //Cancel
		  actionsAddresses.Append 0 //destructiveAction
		  actionTags.Append "CANCEL"
		  actionTags.Append "DESTRUCTIVE"
		  
		  if cb=nil then Return
		  actionMode=ModeAction.tag
		  taggedAction=cb
		  
		  Var UIAlertController as Ptr
		  Declare Function alertControllerWithTitlemessagepreferredStyle lib "UIKit" selector "alertControllerWithTitle:message:preferredStyle:" (class_ref as Ptr,title as CFStringRef,message as CFStringRef,preferredStyle as UIAlertControllerStyle) as Ptr
		  UIAlertController=alertControllerWithTitlemessagepreferredStyle(NSClassFromString("UIAlertController"),title,description,UIAlertControllerStyle.Alert)
		  
		  Declare Function actionWithTitlestylehandler lib "UIKit" selector "actionWithTitle:style:handler:" (class_ref as Ptr,title as CFStringRef,style as UIAlertActionStyle,handler as Ptr) as Ptr
		  Declare Sub addAction lib "Foundation" selector "addAction:" (obj_ref as Ptr,action as Ptr)
		  Var ib As new iOSBlock(AddressOf actionBoxAction)
		  Var bAction As Ptr
		  
		  Var actionClass as Ptr=NSClassFromString("UIAlertAction")
		  for i as integer=0 to actions.Ubound
		    bAction=actionWithTitlestylehandler(actionClass,actions(i).caption,UIAlertActionStyle.Default,ib.Handle)
		    addAction(UIAlertController,bAction)
		    actionsAddresses.Append UInteger(bAction)
		    actionTags.Append actions(i).tag
		  next
		  
		  if destructiveAction<>"" then
		    bAction=actionWithTitlestylehandler(actionClass,destructiveAction,UIAlertActionStyle.Destructive,ib.Handle)
		    addAction(UIAlertController,bAction)
		    actionsAddresses(1)=UInteger(bAction)
		  end if
		  
		  if cancelAction<>"" then
		    bAction=actionWithTitlestylehandler(actionClass,cancelAction,UIAlertActionStyle.Cancel,ib.Handle)
		    addAction(UIAlertController,bAction)
		    actionsAddresses(0)=UInteger(bAction)
		  end if
		  
		  if actionsAddresses.Ubound=1 and actionsAddresses(0)=0 and actionsAddresses(1)=0 then  //A button must exist
		    bAction=actionWithTitlestylehandler(actionClass,"CANCEL",UIAlertActionStyle.Cancel,ib.Handle)
		    addAction(UIAlertController,bAction)
		    actionsAddresses(0)=UInteger(bAction)
		  end if
		  
		  Declare Sub presentViewControlleranimatedcompletion lib "UIKit" selector "presentViewController:animated:completion:" (obj_ref as Ptr,viewControllerToPresent as Ptr,flag as Boolean,completion as Ptr)
		  presentViewControlleranimatedcompletion(callerView.ViewControllerHandle,UIAlertController,true,nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub actionBoxAction(btn as UInteger)
		  Var index as integer=actionsAddresses.IndexOf(btn)
		  if actionMode=ModeAction.indexed then
		    if indexedAction<>nil then indexedAction.Invoke(index-2)
		    indexedAction=nil
		  else
		    if taggedAction<>nil then taggedAction.Invoke(actionTags(index))
		    taggedAction=nil
		    actionTags.ResizeTo(-1)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub addPasswordField(tf as Ptr)
		  Declare Sub setPlaceHolder Lib "UIKit" Selector "setPlaceholder:" (o As Ptr,txt As CFStringRef)
		  setPlaceHolder(tf,"Password")
		  
		  Declare Sub setSecure Lib "UIKit" Selector "setSecureTextEntry:" (o As Ptr,mode As Boolean)
		  setSecure(tf,true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub addUsernameField(tf as Ptr)
		  Declare Sub setPlaceHolder Lib "UIKit" Selector "setPlaceholder:" (o As Ptr,txt As CFStringRef)
		  
		  setPlaceHolder(tf, CurrentHint)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub cb_actionIndex(index as integer)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub cb_actionTag(tag as Variant)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub cb_textResult(result() as String)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Sub dismissUIAlertAction(id as ptr,sel as ptr, view as ptr,index As integer)
		  #Pragma Unused id
		  #Pragma Unused sel
		  #Pragma Unused view
		  if actionMode=ModeAction.indexed then
		    if indexedAction<>nil then 
		      Var idx As Integer=actionsAddresses.IndexOf(index+1)
		      if idx=-1 then
		        indexedAction.Invoke(-2)
		      else
		        indexedAction.Invoke(idx-2)
		      End If
		      indexedAction=nil
		    end if
		  else
		    if taggedAction<>nil then 
		      Var idx as integer=actionsAddresses.IndexOf(index+1)
		      if idx=-1 then
		        taggedAction.Invoke(actionTags(0))
		      else
		        taggedAction.Invoke(actionTags(idx))
		      end if
		    end if
		    taggedAction=nil
		    actionTags.ResizeTo(-1)
		  end if
		  UIAlertActionDelegate=nil //Do I have to destroy
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function NSClassFromString Lib "Foundation" (classname as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Sub setText(value as String)
		  #Pragma Unused value
		  if textAction=nil then Return
		  
		  declare function textFields lib "UIKit" selector "textFields" (o as Ptr) as ptr
		  //Collect the textFields
		  Var tt as ptr=TextFields(currentTextAlert)
		  
		  Declare function obAtIndex lib "Foundation" selector "objectAtIndex:"(o as ptr,index as integer) as Ptr
		  declare sub setText lib "UIKit" selector "setText:" (o as Ptr, tvalue as CFStringRef)
		  
		  Var t as Ptr=obAtIndex(tt,0)
		  setText(t, value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub textInput(callerView as MobileScreen, title as String, description as String, cb as iosAlert.cb_textResult, cancelCaption as String = "Cancel", okCaption as String = "Ok", value as String = "", hint as String = "")
		  if cb=nil then Return
		  actionMode=ModeAction.text
		  textAction=cb
		  if hint <> "" then CurrentHint = hint
		  
		  Var UIAlertController As Ptr
		  Declare Function alertControllerWithTitlemessagepreferredStyle lib "UIKit" selector "alertControllerWithTitle:message:preferredStyle:" (class_ref as Ptr,title as CFStringRef,message as CFStringRef,preferredStyle as UIAlertControllerStyle) as Ptr
		  UIAlertController=alertControllerWithTitlemessagepreferredStyle(NSClassFromString("UIAlertController"),title,description,UIAlertControllerStyle.Alert)
		  
		  Declare Function actionWithTitlestylehandler lib "UIKit" selector "actionWithTitle:style:handler:" (class_ref as Ptr,title as CFStringRef,style as UIAlertActionStyle,handler as Ptr) as Ptr
		  
		  Var ib as iOSBlock
		  ib=new iOSBlock(AddressOf textInputOk)
		  Var OKAction as Ptr=actionWithTitlestylehandler(NSClassFromString("UIAlertAction"),okCaption,UIAlertActionStyle.Default,ib.Handle)
		  
		  Var CancelAction as Ptr=actionWithTitlestylehandler(NSClassFromString("UIAlertAction"),cancelCaption,UIAlertActionStyle.cancel,nil)
		  
		  Declare sub addTextField lib "UIKit" selector "addTextFieldWithConfigurationHandler:" (o as Ptr,handler as Ptr)
		  ib=new iOSBlock(addressOf addUsernameField)
		  addTextField(UIAlertController,ib.handle)
		  
		  Declare Sub addAction lib "UIKit" selector "addAction:" (obj_ref as Ptr,action as Ptr)
		  addAction(UIAlertController,OKAction)
		  addAction(UIAlertController,CancelAction)
		  
		  currentTextAlert=UIAlertController
		  
		  if value <> "" then
		    setText(value)
		  end if
		  
		  Declare Sub presentViewControlleranimatedcompletion lib "UIKit" selector "presentViewController:animated:completion:" (obj_ref as Ptr,viewControllerToPresent as Ptr,flag as Boolean,completion as ptr)
		  presentViewControlleranimatedcompletion(callerView.ViewControllerHandle,UIAlertController,true,nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub textInputCancel(item As ptr)
		  #Pragma Unused item
		  
		  textAction=nil
		  currentTextAlert=nil //Do I have to destroy?
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub textInputEnd(id as ptr,sel as ptr, view as ptr,index As integer)
		  #Pragma Unused id
		  #Pragma Unused sel
		  if index=1 then
		    declare function textFieldAtIndex Lib "UIKit" selector "textFieldAtIndex:"(o as ptr,index as integer) as ptr
		    declare function getText lib "UIKit" selector "text" (o as Ptr) as CFStringRef
		    Var r() as String
		    r.Append getText(textFieldAtIndex(view,0))
		    if actionMode=ModeAction.login then
		      r.Append getText(textFieldAtIndex(view,1))
		    end if
		    textAction.invoke(r)
		  end if
		  textAction=nil
		  UIAlertActionDelegate=nil
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub textInputOk(item As ptr)
		  #Pragma Unused item
		  if textAction=nil then Return
		  Var r() as String
		  
		  declare function textFields lib "UIKit" selector "textFields" (o as Ptr) as ptr
		  //Collect the textFields
		  Var tt as ptr=TextFields(currentTextAlert)
		  
		  Declare function obAtIndex lib "Foundation" selector "objectAtIndex:"(o as ptr,index as integer) as Ptr
		  declare function getText lib "UIKit" selector "text" (o as Ptr) as CFStringRef
		  
		  Var t as Ptr=obAtIndex(tt,0)
		  r.Append getText(t)
		  
		  if actionMode=ModeAction.login then
		    t=obAtIndex(tt,1)
		    r.Append getText(t)
		  end if
		  textAction.invoke(r)
		  textAction=nil
		  currentTextAlert=nil //Do I have to destroy?
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private actionMode As ModeAction
	#tag EndProperty

	#tag Property, Flags = &h21
		Private actionsAddresses() As uinteger
	#tag EndProperty

	#tag Property, Flags = &h21
		Private actionTags() As auto
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ClassUIAlertCustomActionDelegate As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ClassUIAlertCustomTextDelegate As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentHint As String = "New Category value"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private currentTextAlert As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private indexedAction As cb_actionIndex
	#tag EndProperty

	#tag Property, Flags = &h21
		Private taggedAction As cb_actionTag
	#tag EndProperty

	#tag Property, Flags = &h21
		Private textAction As cb_textResult
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UIAlertActionDelegate As Ptr
	#tag EndProperty


	#tag Enum, Name = ModeAction, Type = Integer, Flags = &h21
		indexed
		  tag
		  text
		  pass
		login
	#tag EndEnum

	#tag Enum, Name = UIAlertActionStyle, Flags = &h21
		Default
		  Cancel
		Destructive
	#tag EndEnum

	#tag Enum, Name = UIAlertControllerStyle, Flags = &h21
		ActionSheet
		Alert
	#tag EndEnum

	#tag Enum, Name = UIAlertViewStyle, Flags = &h21
		Default
		  SecureTextInput
		  PlainTextInput
		LoginAndPasswordInput
	#tag EndEnum


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
End Module
#tag EndModule
