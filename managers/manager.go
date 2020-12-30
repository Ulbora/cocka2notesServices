package managers

/*
 Six910 is a shopping cart and E-commerce system.

 Copyright (C) 2020 Ulbora Labs LLC. (www.ulboralabs.com)
 All rights reserved.

 Copyright (C) 2020 Ken Williamson
 All rights reserved.

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import (
	db "github.com/Ulbora/cocka2notesServices/cocka2db"
)

//ResponseID ResponseID
type ResponseID struct {
	ID      int64  `json:"id"`
	Success bool   `json:"success"`
	Code    int64  `json:"code"`
	Message string `json:"message"`
}

//Response Response
type Response struct {
	Success bool   `json:"success"`
	Code    int64  `json:"code"`
	Message string `json:"message"`
}

//NoteUsers NoteUsers
type NoteUsers struct {
	OwnerEmail string `json:"ownerEmail"`
	NoteID     int64  `json:"noteId"`
	UserEmail  string `json:"userEmail"`
}

//Manager Manager
type Manager interface {
	AddUser(u *db.User) *Response
	UpdateUser(u *db.User) *Response
	// GetUser(email string) *db.User
	// DeleteUser(email string) *Response

	AddUserToNote(nu *NoteUsers) *Response

	AddNote(n *db.Note) *ResponseID
	// UpdateNote(n *db.Note) *Response
	// GetNote(id int64) *db.Note
	// GetUsersNotes(email string) *[]db.Note
	// DeleteNote(id int64) *Response

	// AddCheckboxItem(ni *db.CheckboxNoteItem) *ResponseID
	// UpdateCheckboxItem(ni *db.CheckboxNoteItem) *Response
	// GetCheckboxItemList(noteID int64) *[]db.CheckboxNoteItem
	// DeleteCheckboxItem(id int64) *Response

	// AddNoteItem(ni *db.NoteItem) *ResponseID
	// UpdateNoteItem(ni *db.NoteItem) *Response
	// GetNoteItemList(noteID int64) *[]db.NoteItem
	// DeleteNoteItem(id int64) *Response
}
