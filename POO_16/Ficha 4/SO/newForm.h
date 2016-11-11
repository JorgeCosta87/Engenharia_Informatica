/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   newForm.h
 * Author: costa
 *
 * Created on 9 de Novembro de 2016, 23:19
 */

#ifndef _NEWFORM_H
#define _NEWFORM_H

#include "ui_newForm.h"

class newForm : public QDialog {
    Q_OBJECT
public:
    newForm();
    virtual ~newForm();
private:
    Ui::newForm widget;
};

#endif /* _NEWFORM_H */
