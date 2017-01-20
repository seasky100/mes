#if !defined(AFX_LOGIN_H__BA281A03_FDCA_42F1_B47C_BB9544C9AFDB__INCLUDED_)
#define AFX_LOGIN_H__BA281A03_FDCA_42F1_B47C_BB9544C9AFDB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Login.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CLogin dialog

class CLogin : public CDialog
{
// Construction
public:
	CLogin(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CLogin)
	enum { IDD = IDD_LOGIN };
	CEdit	m_ctrProductionLine;
	CComboBox	m_ctrComboxProduct;
	CComboBox	m_ctrComboxOrder;
	CButton	m_ctrSelect;
	CEdit	m_ctrOrder;
	CString	m_csOrder;
	BOOL	m_bSelect;
	int		m_iComboxOrder;
	int		m_iComboxProduct;
	CString	m_csProductionLine;
	//}}AFX_DATA
public:
	DWORD	m_iFirstKeyTime;
	DWORD	m_iLastKeyTime;
	DWORD	m_iKeyPeriod;

	CString csProduct;
	CString csOrder;
	CString csProductionLine;

public:
	bool GetProductList();
	bool GetOrderList();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLogin)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CLogin)
	virtual BOOL OnInitDialog();
	afx_msg void OnChangeEditOrder();
	virtual void OnOK();
	virtual void OnCancel();
	afx_msg void OnCheckSelect();
	afx_msg void OnCloseupComboOrder();
	afx_msg void OnCloseupComboProduct();
	afx_msg void OnChangeEditLine();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LOGIN_H__BA281A03_FDCA_42F1_B47C_BB9544C9AFDB__INCLUDED_)
